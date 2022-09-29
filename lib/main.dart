import 'package:flutter/material.dart';
import 'dto/film.dart';
import 'screens/info_film_screen.dart';

void main() {
  runApp(const FilmCatalogApp());
}

class FilmCatalogApp extends StatelessWidget {
  const FilmCatalogApp({Key? key}) : super(key: key);

  @override
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
