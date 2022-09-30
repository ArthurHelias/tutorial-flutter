
import 'package:tutorial_flutter/dto/film.dart';

class FilmDetails extends Film {
  final String rated;
  final int runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final dynamic ratings;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String totalSeasons;

  FilmDetails(
      this.rated,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.ratings,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.totalSeasons,
      {required String id,
      required String title,
      required String type,
      required String year,
      required String color,
      required String image})
      : super(
            id: id,
            title: title,
            type: type,
            year: year,
            color: color,
            image: image);
}
