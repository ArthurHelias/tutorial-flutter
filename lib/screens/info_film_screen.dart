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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Row(children: [
                    Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Image.network(
                            "https://www.ugc.fr/dynamique/films/05/8005/fr/poster/large/2146702_5.jpg"),
                        height: 200,
                        width: 100),
                    Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(10.0),
                        child: Text(film.toString(),
                            style: TextStyle(color: Colors.white)),
                        color: hexToColor(film.color),
                        height: 180,
                        width: 200)
                  ]),
                  Container(
                      child: Text(film.type, style: TextStyle(color: Colors.white)),
                      color: hexToColor(film.color),
                      padding: const EdgeInsets.all(10.0),
                      height: 160,
                      width: 330),
                ],
              ),
            ),
          )),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
