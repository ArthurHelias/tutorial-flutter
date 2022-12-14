import 'package:flutter/material.dart';
import 'package:tutorial_flutter/dto/film.dart';
import 'package:tutorial_flutter/screens/info_film_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FilmWidget extends StatelessWidget {
  final Film film;

  const FilmWidget({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: hexToColor(film.color),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoFilmScreen(film: film),
                ),
              );
            },
            leading: Padding(
              padding: const EdgeInsets.all(0.0),
              child: CachedNetworkImage(
                imageUrl: film.image,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset("assets/images/error.png"),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(film.title,
                      style: const TextStyle(
                          color: Color(0xff2b2d42),
                          fontWeight: FontWeight.bold,
                          fontSize: 18))),
            ),
            subtitle: Center(
                child: Text(film.type,
                    style: const TextStyle(
                        color: Color(0xff8d99ae),
                        fontWeight: FontWeight.bold,
                        fontSize: 15))),
            trailing: Text(
              film.year,
              style: const TextStyle(
                  color: Color(0xff2b2d42),
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
