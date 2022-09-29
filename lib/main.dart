import 'package:flutter/material.dart';
import 'dto/film.dart';
import 'screens/info_film_screen.dart';
import 'package:tutorial_flutter/film_catalog_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: MyList());
  Widget build(BuildContext context) {
    final film = Film(
        id: 10,
        title: "irjrjsg",
        type: "series",
        year: "2020",
        color: "#d62828",
        image:
            "https://www.referenseo.com/wp-content/uploads/2019/03/image-attractive-960x540.jpg");
    return MaterialApp(
        title: "Film Info",
        theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: InfoFilmScreen(film: film)));
  }
}

class MyList extends StatefulWidget {
  @override
  FilmCatalogApp createState() => FilmCatalogApp();
}