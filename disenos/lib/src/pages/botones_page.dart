import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:math';


class BotonesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget> [
          _fondoApp(),

          SingleChildScrollView(
            child: Column(
              children:<Widget> [
                _titulos(),
                _botonesRedondeados(context)
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context)
    );
  }

  Widget _fondoApp(){

    final gradiente = Container(
      width  : double.infinity,
      height : double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi/5.0,
      child: Container(
      height: 360.0,
      width: 360.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90.0),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0)
          ]
        )
       ),
      )
    );    

    return Stack(
      children:<Widget> [
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa,
        )
      ],
    );

  }


  Widget _titulos(){

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Text('Classify Transaction', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Classify this transaction into a particular category for better use', style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );

  }

  Widget _bottomNavigationBar(BuildContext context){

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart, size: 30.0),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            label: ''
          )
        ],
      ),
    );

  }


  Widget _botonesRedondeados(BuildContext context){

    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General', context),
            _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, 'Bus', context),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.yellow, Icons.fiber_new_rounded, 'Noticias', context),
            _crearBotonRedondeado(Colors.orangeAccent, Icons.sms_failed_rounded, 'Alertas', context),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.tealAccent, Icons.pie_chart_outline_outlined, 'Graficas', context),
            _crearBotonRedondeado(Colors.blueGrey, Icons.place, 'Mapas', context),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.green, Icons.play_circle_fill_outlined, 'Videos', context),
            _crearBotonRedondeado(Colors.lime, Icons.laptop_chromebook_outlined, 'Ajustes', context),
          ]
        )
      ],
    );

  }


  Widget _crearBotonRedondeado(Color color, IconData icono, String texto, BuildContext context){

    return Padding(
      padding: EdgeInsets.all(15.0),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 180.0,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.70),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget> [
                SizedBox(height: 5.0),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 40.0,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'basico');
                    },
                    icon: Icon(icono),
                    iconSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                Text(texto, style: TextStyle(color: color)),
                SizedBox(height: 5.0)
              ],
            ),
          ),
        ),
      ),
    );

  }

}