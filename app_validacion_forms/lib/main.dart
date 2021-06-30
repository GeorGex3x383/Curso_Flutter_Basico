import 'package:flutter/material.dart';

import 'package:app_validacion_forms/src/bloc/provider.dart';

import 'package:app_validacion_forms/src/pages/home_page.dart';
import 'package:app_validacion_forms/src/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        initialRoute: 'login',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'home'  : (BuildContext context) => HomePage(),
        },
        theme: ThemeData(
          primaryColor: Colors.orangeAccent
        ),
      )
    );
  }
}

