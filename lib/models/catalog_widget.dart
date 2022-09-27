class CatalogModel {
  static final items = [
    Item(
        id: 1,
        title: "Film",
        genre: "Genre",
        year: "2000",
        color: "#FF0000",
        image:
            "https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg")
  ];
}

class Item {
  final int id;
  final String title;
  final String genre;
  final String year;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.title,
      required this.genre,
      required this.year,
      required this.color,
      required this.image});
}
