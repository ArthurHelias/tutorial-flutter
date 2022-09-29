class Film {
  final int id;
  final String title;
  final String type;
  final String year;
  final String color;
  final String image;

  Film({required this.id,
    required this.title,
    required this.type,
    required this.year,
    required this.color,
    required this.image});

  @override
  toString() {
    return ("Id: ${this.id};\n Type: ${this.type};\n Year: ${this.year};\n Color: ${this.color};\n Image: ${this.image};\n");
  }

}


