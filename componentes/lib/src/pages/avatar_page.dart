import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions:<Widget> [

          Container(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage:  NetworkImage('https://wipy.tv/wp-content/uploads/2020/10/elizabeth-olsen-cancela-participacion-en-convencion.jpg'),
              radius: 20.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('JG'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://lanetaneta.com/wp-content/uploads/2020/12/Nuevo-anuncio-de-television-revela-el-colapso-de-Scarlet-Witch.jpeg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}