import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutorial_flutter/models/catalog_model.dart';
import 'package:tutorial_flutter/widgets/film_widget.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

void main() {
  runApp(FilmCatalogApp());
}

class FilmCatalogApp extends StatelessWidget {
  FilmCatalogApp({Key? key}) : super(key: key);

  final String apikey = "fa35d40a";
  final String urlRequest = "omdbapi.com";
  String data = "";
  String title = "";
  TextEditingController myController = TextEditingController();

  void sendRequest() {
    Future<void> request() async {
      final client = RetryClient(http.Client());
      try {
        title = myController.text.toString();
        var requestUrl = Uri.parse("https://omdbapi.com/?apikey=$apikey&s=$title");
        var response = await http.get(requestUrl);
        var json = jsonDecode(response.body);

        //data = json.toString();
        if (json['Response'] == 'True') {
          var list = json['Search'] as List<dynamic>;
          data = "List  =  ${list.length}";
        } else if (json['Error'] != null) {
          data = "Error : ${json['Error']}";
          print(data);
        } else {
          data = "Error in api request";
        }
        //data = await client.read(Uri.https(requestUrl.toString(), ""));
      } finally {
        client.close();
      }
    }
    request();
  }

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: "Films' Catalog",
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    debugShowCheckedModeBanner: false,


    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text("Films' Catalog"),
      ),
      body: Center(
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',
          ),
        ),
      )
    ),
  );
}}


@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: "Tutorial Flutter",
    theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text("Films' Catalog"),
      ),
      body: ListView.builder(
          itemCount: CatalogModel.films.length,
          itemBuilder: (context, index) {
            return FilmWidget(film: CatalogModel.films[index]);
          }),
    ),
  );
}
}