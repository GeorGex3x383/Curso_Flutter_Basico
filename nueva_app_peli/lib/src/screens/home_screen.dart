import 'package:flutter/material.dart';
import 'package:nueva_app_peli/src/providers/movies_provider.dart';
import 'package:nueva_app_peli/src/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:nueva_app_peli/src/search/search_delegate.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
          icon: const Icon(Icons.search_outlined)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          CardSwiper(movies: moviesProvider.onDisplayMovie),
          MovieSlider(movies: moviesProvider.popularMovies, title: 'Populares', onNextPage: () => moviesProvider.getPopularMovies()),
          const SizedBox(height: 5),
          MovieSlider(movies: moviesProvider.topRatedMovies, title: 'Mejor calificadas', onNextPage: () => moviesProvider.getTopRatedMovies()),
          const SizedBox(height: 5),
          MovieSlider(movies: moviesProvider.upcomingMovies, title: 'Próximamente...', onNextPage: () => moviesProvider.getUpcomingMovies())
        ],
      ),
      ),  
    );
  }
}
