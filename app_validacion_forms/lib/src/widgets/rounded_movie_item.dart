import 'package:flutter/material.dart';


class RoundedMovieItem extends StatelessWidget {
  final String pathMovie;
  final Color color;
  RoundedMovieItem({this.pathMovie, this.color });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      width: 110.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          color: color,
          width: 2.0
        )
      ),
      child: ClipOval(
        child: Image.asset('assets/images/$pathMovie',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}