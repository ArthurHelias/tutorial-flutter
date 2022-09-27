class CatalogModel {
  static final films = [
    Film(
        id: 1,
        title: "Film",
        type: "Type",
        year: "2000",
        color: "#A2A7A5",
        image:
            "https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg")
  ];
}

class Film {
  final int id;
  final String title;
  final String type;
  final String year;
  final String color;
  final String image;

  Film(
      {required this.id,
      required this.title,
      required this.type,
      required this.year,
      required this.color,
      required this.image});
}
