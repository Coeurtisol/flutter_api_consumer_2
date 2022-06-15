import 'package:api_consumer_2/model/film.dart';
import "package:flutter/material.dart";

class FilmWidget extends StatelessWidget {
  // const FilmWidget({Key? key, required this.film}) : super(key: key);
  const FilmWidget({Key? key, required this.title}) : super(key: key);

  // final Film film;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      // child: Text(film.title),
      child: Text(title),
    );
  }
}