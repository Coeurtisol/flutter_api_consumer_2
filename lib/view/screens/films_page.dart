import 'package:api_consumer_2/model/film.dart';
import 'package:api_consumer_2/data/films_data.dart';
import 'package:api_consumer_2/view/widgets/film_widget.dart';
import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  Future<List> getFilms() async {
    var plainJson = await FilmsData().getPopularFilms();
    print(plainJson);
    var films = plainJson['results'] as List;
    return films;
  }

  @override
  Widget build(BuildContext context) {
    var filmsData = getFilms();
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData == true) {
          // final data = snapshot.data as List<Film>;
          final data = snapshot.data as List;
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              // return FilmWidget(film: data[index]);
              return FilmWidget(title: data[index]['title']);
            },
            itemCount: data.length,
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chargement des films populaires'),
                CircularProgressIndicator()
              ],
            ),
          );
        }
      },
      future: getFilms(),
    );
  }
}
