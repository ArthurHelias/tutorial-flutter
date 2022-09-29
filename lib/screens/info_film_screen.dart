import 'package:flutter/material.dart';

import '../dto/film.dart';

class InfoFilmScreen extends StatelessWidget {
  final Film film;

  const InfoFilmScreen({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: film.title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            backgroundColor: Color(0xffd90429),
            title: Text(film.title)),
        body: Center(
            child: Text(film.toString(),
                style: TextStyle(backgroundColor: hexToColor(film.color)))),
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
