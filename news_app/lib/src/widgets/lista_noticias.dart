import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/tema.dart';


class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
      return _Noticia(noticia: this.noticias[index], index: index);
     },
    );
  }
}


class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({@required this.noticia, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia, index),
        _TrajetaTitulo(noticia),
        _TarjetaImagen(noticia),
        _TarjetaBody(noticia),
        _TarjetaBotones(),
        SizedBox(height: 10.0),
        Divider(),
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text('${index + 1}. ', style: TextStyle(color: miTema.accentColor)),
          Text('${noticia.source.name}. '),
        ],
      ),
    );
  }
}

class _TrajetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TrajetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(noticia.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
        child: Container(
          child: ( noticia.urlToImage != null ) 
          ? FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage),
          )
          : Image(image: AssetImage('assets/img/no-image.png')),
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Article noticias;

  const _TarjetaBody(this.noticias);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text( (noticias.description != null) ? noticias.description : ''),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            fillColor: miTema.accentColor,
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10.0),
          RawMaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            fillColor: miTema.buttonColor,
            child: Icon(Icons.more_horiz_outlined),
          )
        ],
      ),
    );
  }
}