import 'package:api_consumer_2/model/acteur.dart';
import "package:flutter/material.dart";

class ActeurWidget extends StatelessWidget {
  const ActeurWidget({Key? key, required this.acteur}) : super(key: key);

  final Acteur acteur;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      child: Text(acteur.name),
    );
  }
}