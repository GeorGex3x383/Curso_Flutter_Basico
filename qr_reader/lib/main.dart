import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/src/pages/home_page.dart';
import 'package:qr_reader/src/pages/mapa_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  final _colorPrincipal = Color.fromRGBO(70, 116, 254, 1.0);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home'  : ( _ ) => HomePage(),
          'mapa'  : ( _ ) => MapaPage(),
        },
        theme: ThemeData(
          primaryColor: _colorPrincipal,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: _colorPrincipal,
          )
        ),
      ),
    );
  }
}