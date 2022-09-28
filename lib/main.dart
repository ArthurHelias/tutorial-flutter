import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutorial_flutter/models/catalog_model.dart';
import 'package:tutorial_flutter/widgets/film_widget.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: MyList());
}

class MyList extends StatefulWidget {
  @override
  FilmCatalogApp createState() => FilmCatalogApp();
}

class FilmCatalogApp extends State<MyList> {
  final String apikey = "fa35d40a";
  final String urlRequest = "omdbapi.com";
  String data = "";
  String title = "";
  List<Film> films = [];
  List<Film> newFilms = [];
  TextEditingController myController = TextEditingController();

  void sendRequest(String title) {
    Future<void> request() async {
      final client = RetryClient(http.Client());
      try {
        title = myController.text.toString();
        var requestUrl =
            Uri.parse("https://omdbapi.com/?apikey=$apikey&s=$title");
        var response = await http.get(requestUrl);
        var json = jsonDecode(response.body);
        newFilms.clear();

        //data = json.toString();
        if (json['Response'] == 'True') {
          var listeFilms = json['Search'] as List<dynamic>;
          data = "List  =  ${listeFilms.length}";
          print(data);
          for (int i = 0; i < listeFilms.length; i++) {
            var film = listeFilms[i];
            Film newFilm = Film(
                id: i,
                title: film['Title'],
                type: film['Type'],
                year: film['Year'],
                color: "#dad7cd",
                image: film['Poster']);
            newFilms.add(newFilm);
          }
          print(json.toString());
        } else if (json['Error'] != null) {
          data = "Error : ${json['Error']}";
          print(data);
        } else {
          data = "Error in api request";
        }
        //data = await client.read(Uri.https(requestUrl.toString(), ""));
        print(data);
      } finally {
        client.close();
      }
    }

    request();
    print(newFilms.length);
    refresh();
  }

  Future refresh() async {
    films = newFilms;
    setState(() {
      films = newFilms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Films' Catalog",
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffedede9)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xffd90429),
            title: const Text("Films' Catalog"),
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: myController,
                    textInputAction: TextInputAction.go,
                    onSubmitted: sendRequest,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                ),
                RefreshIndicator(
                    child: Container(
                      height: 550,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: films.length,
                          itemBuilder: (context, index) {
                            return FilmWidget(film: films[index]);
                          }),
                    ),
                    onRefresh: refresh),
              ],
            ),
          )),
    );
  }
}
