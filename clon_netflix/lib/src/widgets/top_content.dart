import 'package:flutter/material.dart';

class TopContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/background.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 436.5,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: <Color> [
                Colors.black38,
                Colors.black87
              ]
            )
          ),
        ),
        _navBar(),
      ],
    );
  }

  Widget _navBar() {
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 16.0);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/logoNetflix2.png',
              height: 60.0,
            ),
            Text('Series', style: estiloTexto),
            Text('Films', style: estiloTexto),
            Text('Clips', style: estiloTexto)
          ],
        ),
      ),
    );
  }
}