import 'package:flutter/material.dart';
import 'package:peli_app/src/models/actores_model.dart';
import 'package:peli_app/src/models/pelicula_model.dart';
//import 'package:peli_app/src/models/pelicula_model.dart';


class ActorDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

//final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
final Actor actor = ModalRoute.of(context).settings.arguments;

     return Scaffold(
      body: CustomScrollView(
        slivers:<Widget> [
          _crearAppbar(actor),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0),
                _posterTitulo( actor , context),
              ]
            ),
          ),
        ],
      )
    );
  }

  Widget _crearAppbar(Actor actor){


    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.deepOrangeAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          actor.name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
        background: FadeInImage(
          image: NetworkImage(actor.getFoto()),
          placeholder: AssetImage('assets/img/carga.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );

  }

  Widget _posterTitulo(Actor actor, BuildContext context){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children:<Widget> [
          Hero(
            tag: actor.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: NetworkImage(actor.getFoto()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text(actor.name, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis),
                Text(actor.character, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),
                Row(
                  children:<Widget> [
                    Icon(Icons.people_outline_sharp),
                    Text(actor.popularity.toString(), style: Theme.of(context).textTheme.subtitle1)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

  }

}