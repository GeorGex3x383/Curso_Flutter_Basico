import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed:()=> _mostrarAlerta( context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings_backup_restore_rounded, color: Colors.white),
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta( BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0) ),
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:<Widget> [
              Text('Este es el contenido del pop up de la alerta wuju'),
              FlutterLogo( size: 100.0)
            ],
          ),
          actions:<Widget> [
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Aceptar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}