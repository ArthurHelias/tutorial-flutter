import 'dto/film.dart';

class Request {
  static Film jsonToFilm(var filmJson) {
    String type = filmJson['Type'];
    var color;
    if (type == "series") {
      color = "#a8dadc";
    } else if (type == "game") {
      color = "#f6bd60";
    } else {
      color = "#fcd5ce";
    }

    return Film(
        id: filmJson['imdbID'],
        title: filmJson['Title'],
        type: type.substring(0, 1).toUpperCase() + type.substring(1),
        year: filmJson['Year'],
        color: color,
        image: filmJson['Poster']);
  }
}
