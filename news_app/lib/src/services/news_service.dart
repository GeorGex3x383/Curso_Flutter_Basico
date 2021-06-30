import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY  = '9437722a818e44018df53dd863bf2dda';

class NewsService with ChangeNotifier{

  List<Article> headlines = [];
  String _selectedCategory = 'business';
  

  List<Category> categories =[
    Category( FontAwesomeIcons.businessTime, 'business'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.footballBall, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService(){
    this.getTopHeadlines();
    categories.forEach((item) {
      this.categoryArticles[item.name] = [];
    });
  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory( String valor){
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);

    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async{

    final url  = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=mx';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();

  }

  getArticlesByCategory( String category) async{

    if(categoryArticles[category].length > 0 ){
      return categoryArticles[category];
    }

    final url  = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=mx&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category].addAll(newsResponse.articles);

    notifyListeners();

  }

}