import 'package:flutter/material.dart';
import 'package:push_app/src/pages/home_page.dart';
import 'package:push_app/src/pages/mensaje_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push App',
      initialRoute: 'home',
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        'mensaje' : (BuildContext context) => MensajePage(),
      },
    );
  }
}