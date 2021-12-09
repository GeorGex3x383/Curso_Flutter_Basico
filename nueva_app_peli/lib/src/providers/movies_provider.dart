import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app_peli/src/helpers/debouncer.dart';
import 'package:nueva_app_peli/src/models/models.dart';
import 'package:nueva_app_peli/src/models/upcoming_response.dart';

class MoviesProvider extends ChangeNotifier{

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'a572f8d01bd499ff737983014692288b';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovie = [];
  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> upcomingMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;
  int _topRatedPage = 0;
  int _upcomingPage = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
    );

  final StreamController<List<Movie>> _streamController = new StreamController.broadcast();
  Stream<List<Movie>> get stream => _streamController.stream;

  MoviesProvider(){
    // ignore: avoid_print
    print('Movies provider inicializado');
    getOnDiplayMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();
  }

  Future<String>_getJsonData(String endpoint, [int page = 1]) async{
    final url = Uri.https(_baseUrl, endpoint,{
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });

    final resp = await http.get(url);
    return resp.body;
  }

  getOnDiplayMovies() async{
    
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResp = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovie = nowPlayingResp.results;
    notifyListeners();

  }

  getPopularMovies() async{

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResp = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResp.results];
    notifyListeners();

  }

  getTopRatedMovies() async{

    _topRatedPage++;

    final jsonData = await _getJsonData('3/movie/top_rated', _topRatedPage);
    final topRatedResp = TopRatedResponse.fromJson(jsonData);

    topRatedMovies = [...topRatedMovies, ...topRatedResp.results];
    notifyListeners();

  }

  getUpcomingMovies() async{

    _upcomingPage++;

    final jsonData = await _getJsonData('3/movie/upcoming', _upcomingPage);
    final upComingResp = UpcomingResponse.fromJson(jsonData);

    upcomingMovies = [...upcomingMovies, ...upComingResp.results];
    notifyListeners();

  }

  Future<List<Cast>> getMovieCast(int movieId) async{

    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResp = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResp.cast;

    return creditsResp.cast;

  }

  Future<List<Movie>> searchMovies(String query) async{

    final url = Uri.https(_baseUrl, '3/search/movie',{
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final resp = await http.get(url);
    final searchResp = SearchResponse.fromJson(resp.body);

    return searchResp.results;

  }

  void getStreamQuery(String query){
    
    debouncer.value = '';
    debouncer.onValue = (value) async{
      final results = await searchMovies(value); 
      _streamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });

    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());

  }

}