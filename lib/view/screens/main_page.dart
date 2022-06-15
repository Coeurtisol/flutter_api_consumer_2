

import 'package:api_consumer_2/view/screens/acteurs_page.dart';
import 'package:api_consumer_2/view/screens/favoris_page.dart';
import 'package:api_consumer_2/view/screens/films_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _widgets = [
    const FilmsPage(),
    const ActeursPage(),
    const FavorisPage(),
  ];

  int _index = 0;

  void _changePage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _widgets[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changePage,
        currentIndex: _index,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined), label: 'Films populaires'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'Acteurs populaires'),
          BottomNavigationBarItem(icon: Icon(Icons.star_border), label: 'Films favoris'),
        ],
      ),
    );
  }
}
