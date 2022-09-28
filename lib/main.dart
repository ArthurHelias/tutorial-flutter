import 'package:flutter/material.dart';
import 'package:tutorial_flutter/models/catalog_model.dart';
import 'package:tutorial_flutter/widgets/film_widget.dart';

void main() {
  runApp(const FilmCatalogApp());
}

class FilmCatalogApp extends StatelessWidget {
  const FilmCatalogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Films' Catalog",
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text("Films' Catalog"),
        ),
        body: ListView.builder(
            itemCount: CatalogModel.films.length,
            itemBuilder: (context, index) {
              return FilmWidget(film: CatalogModel.films[index]);
            }),
      ),
    );
  }
}
