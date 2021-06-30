import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children:<Widget> [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo3(),
          SizedBox(height: 30.0),
          _cardTipo4(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children:<Widget> [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.redAccent),
            title: Text('Soy el texto dentro de la tarjeta'),
            subtitle: Text('Aqui va un grito: AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH'),
            tileColor: Colors.white10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget> [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Aceptar'),
                onPressed: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children:<Widget> [
          FadeInImage(
            image: NetworkImage('https://i.pinimg.com/originals/80/9b/43/809b43102a7b4bcb18ad66cf48886579.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,

          ),
          //Image(
          //  image: NetworkImage('https://i.pinimg.com/originals/80/9b/43/809b43102a7b4bcb18ad66cf48886579.jpg'),
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Vaya... Como llegó esto aquí?'),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
       boxShadow: <BoxShadow>[
         BoxShadow(
           color: Colors.black26,
           blurRadius: 10.0,
           spreadRadius: 1.5,
           offset: Offset(3.0, 10.0)
         )
       ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: card,
      ),
    );
  }
}


Widget _cardTipo3() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children:<Widget> [
          ListTile(
            leading: Icon(Icons.access_alarm, color: Colors.redAccent),
            title: Text('Soy el texto dentro de la tarjeta reloj'),
            subtitle: Text('En esta tarjeta se podrían encontrar algún tipo de alarmas, lamentablemente esa función no esta aqui disponible pero aun así se creo lo tarjeta y se tendra presente ya que es un gran ejemplo y ocupa espacio en esta pestaña'),
            tileColor: Colors.white10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget> [
              FlatButton(
                child: Text('Quitar Alarma'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Insertar Alarma'),
                onPressed: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _cardTipo4() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children:<Widget> [
          FadeInImage(
            image: NetworkImage('https://indiehoy.com/wp-content/uploads/2018/07/back-to-the-future.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,

          ),
          //Image(
          //  image: NetworkImage('https://i.pinimg.com/originals/80/9b/43/809b43102a7b4bcb18ad66cf48886579.jpg'),
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Marty tenemos que volver al pasado para salvarnos!!!'),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
       boxShadow: <BoxShadow>[
         BoxShadow(
           color: Colors.black26,
           blurRadius: 10.0,
           spreadRadius: 1.5,
           offset: Offset(3.0, 10.0)
         )
       ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: card,
      ),
    );
  }

