//import 'dart:js';

import 'package:flutter/material.dart';

import 'package:peli_app/src/models/actores_model.dart';
import 'package:peli_app/src/models/pelicula_model.dart';
import 'package:peli_app/src/providers/peliculas_provider.dart';



class PeliculaDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers:<Widget> [
          _crearAppbar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0),
                _posterTitulo( pelicula , context),
                _descripcion(pelicula, context),
                _infoExtra(pelicula, context),
                _crearCasting(pelicula),
              ]
            ),
          ),
        ],
      )
    );
  }

  Widget _crearAppbar(Pelicula pelicula){

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.deepOrangeAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage('assets/img/carga.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );

  }

  Widget _posterTitulo(Pelicula pelicula, BuildContext context){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children:<Widget> [
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text(pelicula.title, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis),
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),
                Row(
                  children:<Widget> [
                    Icon(Icons.star_border_sharp),
                    Text(pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subtitle1)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _descripcion(Pelicula pelicula , BuildContext context){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );

  }


  Widget _crearCasting(Pelicula pelicula){

    final peliProvider = new PeliculasProvider();

    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if(snapshot.hasData){
          return _crearActoresPageView(snapshot.data, pelicula);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  }

  Widget _crearActoresPageView(List<Actor> actores, Pelicula pelicula){

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: actores.length,
        itemBuilder: (context, i) =>_actorTarjeta( actores[i], context, pelicula),
      ),
    );
  }


  Widget _actorTarjeta(Actor actor, BuildContext context, Pelicula pelicula){
    final tarjetaActor = Container(
      margin: EdgeInsets.only(right:15.0),
      child: Column(
        children:<Widget> [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FadeInImage(
              image: NetworkImage(actor.getFoto()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(actor.name, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subtitle2),
          Text(actor.character, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.overline)
        ],
      ),
    );
    return GestureDetector(
      child: tarjetaActor,
      onTap: (){

        Navigator.pushNamed(context, 'actor', arguments: actor);
      });
  }


Widget _infoExtra(Pelicula pelicula, BuildContext context){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Center(
        child: Text(
          'Fecha de estreno: ${pelicula.releaseDate}\nPopoularidad de pelicula: ${pelicula.popularity}\nIdioma Original: ${pelicula.originalLanguage.toUpperCase()}\nCantidad de votantes: ${pelicula.voteCount}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );

  }
}