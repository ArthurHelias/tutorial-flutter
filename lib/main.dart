import 'package:flutter/material.dart';
import 'package:tutorial_flutter/screens/film_catalog_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: MyList());
}

class MyList extends StatefulWidget {
  @override
  FilmCatalogScreen createState() => FilmCatalogScreen();
}
