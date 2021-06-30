import 'package:flutter/material.dart';


import 'dart:math';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 200.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children:<Widget> [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    final random = Random();

    return Slider(
      activeColor: Color.fromRGBO(
              random.nextInt(255),
              random.nextInt(255), 
              random.nextInt(255), 
              1),
      label: 'Tamaño de la imagen',
      //divisions: 20,        
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
    );

  }

  Widget _checkBox(){

   //return Checkbox(
     return CheckboxListTile(
       title: Text('Bloquear Slider'),
       value: _bloquearCheck,
       onChanged: (valor){
         setState(() {
           _bloquearCheck = valor;
           });
        },
      );
  }

  Widget _crearSwitch(){

    return SwitchListTile(
       title: Text('Bloquear Slider'),
       value: _bloquearCheck,
       onChanged: (valor){
         setState(() {
           _bloquearCheck = valor;
           });
        },
      );

  }

  Widget _crearImagen(){

    return Image(
      image: NetworkImage('https://pngimg.com/uploads/wonder_woman/wonder_woman_PNG57.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

}