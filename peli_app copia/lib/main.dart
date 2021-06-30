import 'package:flutter/material.dart';

import 'package:peli_app/src/pages/home_page.dart';
import 'package:peli_app/src/pages/pelicula_detalle.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) { 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/',
      routes: {
        '/'       : (BuildContext context) => HomePage(),
        'detalle' : (BuildContext context) => PeliculaDetalle(),
      },
    );
  }
}

