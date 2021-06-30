
import 'package:flutter/material.dart';


class ContadorPage extends StatefulWidget{

  @override
  createState() => _ContadorPageState();

}

//El guión bajo hace la clase privada ya que solo se usara para definir el estado de la clase anterior
class _ContadorPageState extends State <ContadorPage> { 

  final _estiloTexto = new TextStyle( fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Se ha oprimido el botón:', style: _estiloTexto),
            Text( '$_conteo', style: _estiloTexto),
          ],
        )
      ),
      //floatingActionButtonLocation: FloatingActionButtoSnLocation.centerFloat,//Tarea clase 50
      floatingActionButton: _crearBotones()
    );
  }

  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox( width: 30.0),
        FloatingActionButton( onPressed: _reset, child: Icon(Icons.exposure_zero_rounded)),
        Expanded(child: SizedBox()),
        FloatingActionButton( onPressed: _sustraer, child: Icon(Icons.remove)),
        SizedBox( width: 5.0),
        FloatingActionButton( onPressed: _agregar, child: Icon(Icons.add)),

      ],
    );  
  }
  void _agregar(){
    setState(() => _conteo++);

  }

  void _sustraer(){
     setState(() => _conteo--);
  }

  void _reset(){
     setState(() => _conteo=0);
  }
}