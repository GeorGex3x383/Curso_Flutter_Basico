import 'package:flutter/material.dart';


class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 15.0, color: Colors.grey );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [
          
          _crearImagen(),
          _crearTitulo(),
          _crearAcciones(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
        ],
        ),
      ),
    );
  }

  Widget _crearImagen(){

    return FadeInImage(
        image: NetworkImage('https://wallpaperaccess.com/full/43142.jpg'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      );

  }

  Widget _crearTitulo(){
    return SafeArea(
      child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Row(
                children:<Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Text('Paisaje atractivo en Japón', style: estiloTitulo),
                            SizedBox(height: 7.0),
                            Text('Un paisaje muy bello', style: estiloSubtitulo)
                          ],
                        ),
                      ),
                    Icon(Icons.star_border, color: Colors.deepOrangeAccent, size: 30.0),
                    Text('41', style: TextStyle(fontSize: 20.0, color: Colors.deepOrangeAccent))
                ],
              ),
            ),
    );
  }

  Widget _crearAcciones(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:<Widget> [
        _accion(Icons.call,'Llamada'),
        _accion(Icons.near_me,'Ruta'),
        _accion(Icons.share,'Compartir'),
      ],
    );

  }

  Widget _accion(IconData icon, String texto){

    return Column(
          children:<Widget> [
            Icon(icon, color: Colors.deepOrangeAccent, size: 30.0),
            SizedBox(height: 5.0),
            Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.deepOrangeAccent)),
          ],
        );

  }

  Widget _crearTexto(){

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Un lugar muy bonito para visitar con toda la familia, ya sea en un fin de semana soleado o en un día de la semana tranquilo y nublado. En este lugar podras disfrutar de una gran vista acompañada de un lago traqnuilo y pacífico.',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }

}