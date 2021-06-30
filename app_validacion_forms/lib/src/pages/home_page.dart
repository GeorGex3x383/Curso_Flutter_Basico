import 'package:app_validacion_forms/src/widgets/rounded_movie_item.dart';
import 'package:app_validacion_forms/src/widgets/top_content.dart';
import 'package:flutter/material.dart';
import 'package:app_validacion_forms/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  final List<dynamic> pathMovies = [{'color': Colors.blue, 'image': 'soul.jpg'}, {'color': Colors.red, 'image': 'rocky.jpg'}, {'color': Colors.purple, 'image': 'avengers.jpg'},{'color': Colors.blue, 'image': 'soul.jpg'}, {'color': Colors.red, 'image': 'rocky.jpg'}, {'color': Colors.purple, 'image': 'avengers.jpg'}];
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    final estiloTexto = TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(   
          children: [
            TopContent(),
            SizedBox(height: 10.0),
            _infoSerie(estiloTexto),
            SizedBox(height: 15.0),
            _botonesSerie(estiloTexto),
            SizedBox(height: 15.0),
            Text('Email usuario: ${bloc.email}', style: estiloTexto),
            Text('Contraseña: ${bloc.password}', style: estiloTexto),
            _listaPopulares(),
            SizedBox(height: 15.0),  
            _listaPopulares(),
            SizedBox(height: 15.0),  
            _listaPopulares(),
          ],
        ),
      ),
      bottomNavigationBar: _barraNavegacion()
    );
  }

  Widget _infoSerie(TextStyle estiloTexto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Acción', style: estiloTexto),
        Text('Suspenso', style: estiloTexto),
        Text('Telenovelesco', style: estiloTexto),
        Text('Comedia', style: estiloTexto),
      ],
    );
  }

  Widget _botonesSerie(TextStyle estiloTexto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => print('Añadir a mi lista'),
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Icon(Icons.add_to_photos_rounded, color: Colors.white),
                Text('Mi lista', style: estiloTexto)
              ],
            ),
          ),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
          ),     
          onPressed: () {},
          icon: Icon(Icons.play_arrow, color: Colors.black),
          label: Text('Reproducir', style: TextStyle(color: Colors.black))
        ),
        Column(
          children: [
            Icon(Icons.info_outline_rounded, color: Colors.white),
            Text('Info.', style: estiloTexto)
          ],
        ),
      ],
    );
  }

  Widget _listaPopulares() {
    return Column(    
      crossAxisAlignment: CrossAxisAlignment.start,  
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Text('Populares', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
        ),
        Container(
          height: 110.0,
          child: ListView.builder(            
            scrollDirection: Axis.horizontal,
            itemCount: pathMovies.length,
            itemBuilder: (BuildContext contex, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: RoundedMovieItem(
                  pathMovie: pathMovies[index]['image'], 
                  color: pathMovies[index]['color']
                ),
              );
            },            
          ),
        )    
      ],
    );
  }

  Widget _barraNavegacion() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(39, 39, 39, 1.0),
      selectedItemColor: Colors.white,
      unselectedItemColor:  Colors.white54,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar'
        ),          
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up_sharp),
          label: 'Tendencias'
        ),  
        BottomNavigationBarItem(
          icon: Icon(Icons.download_done_outlined),
          label: 'Descargas'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menú'
        ),
      ],
    );
  }
}