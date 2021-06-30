import 'package:flutter/material.dart';
import 'package:peli_app/src/models/pelicula_model.dart';
import 'package:peli_app/src/providers/peliculas_provider.dart';


class DataSearch extends SearchDelegate {

  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Aquaman',
    'Batman',
    'Drive and survive',
    'Enredados',
    'Soul',
    'IronMan',
    'SEP',
  ];

  final peliculasRecientes = [
    'Spiderman',
    'Capitan América'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
      //Las acciones de nuestro AppBar (Íconos para limpiar o cancelar la búsqueda)
      return [
        IconButton(
          icon: Icon(Icons.clear_outlined), 
          onPressed: (){
            query = '';
          }
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Ícono a la izquierda del AppBar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation
        ), 
        onPressed: (){
          close(context, null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Instrucción que crea los resultados que se mostrarán
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.deepOrangeAccent,
          child: Text(seleccion),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando la persona escríbe
    if(query.isEmpty){
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {

        if(snapshot.hasData){

          final peliculas = snapshot.data;

          return ListView(
            children: peliculas.map((pelicula){
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text('${pelicula.originalTitle}\nCalificación: ${pelicula.voteAverage}\nIdioma original: ${pelicula.originalLanguage.toUpperCase()}'),
                onTap: (){
                  close(context,null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
                
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

      },
    );

  }


   //@override
    //Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando la persona escríbe

      //final listaSugerida = (query.isEmpty) ? peliculasRecientes 
        //                                    : peliculas.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();




      //return ListView.builder(
        //itemCount: listaSugerida.length,
        //itemBuilder: (context, i){
          //return ListTile(
            //leading: Icon(Icons.movie_creation_outlined),
            //title: Text(listaSugerida[i]),
            //onTap: (){
              //seleccion = listaSugerida[i];
              //showResults(context);
            //},
          //);
        //}
      //);
  //}

}