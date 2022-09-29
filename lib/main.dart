import 'package:flutter/material.dart';
import 'package:tutorial_flutter/film_catalog_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: MyList());
}

class MyList extends StatefulWidget {
  @override
  FilmCatalogApp createState() => FilmCatalogApp();
}