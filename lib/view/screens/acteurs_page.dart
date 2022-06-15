import 'package:api_consumer_2/model/acteur.dart';
import 'package:api_consumer_2/data/acteurs_data.dart';
import 'package:api_consumer_2/view/widgets/acteur_widget.dart';
import 'package:flutter/material.dart';

class ActeursPage extends StatelessWidget {
  const ActeursPage({Key? key}) : super(key: key);

  Future<List> getActeurs() async {
    var plainJson = await ActeursData().getPopularActeurs();
    print(plainJson);
    var acteurs = plainJson['results'] as List;
    return acteurs;
  }

  @override
  Widget build(BuildContext context) {
    var acteursData = getActeurs();
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData == true) {
          final data = snapshot.data as List;
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ActeurWidget(acteur: Acteur.fromJson(data[index]));
            },
            itemCount: data.length,
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chargement des acteurs populaires'),
                CircularProgressIndicator()
              ],
            ),
          );
        }
      },
      future: getActeurs(),
    );
  }
}
