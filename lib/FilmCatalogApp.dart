import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tutorial_flutter/models/catalog_model.dart';
import 'package:tutorial_flutter/widgets/film_widget.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'main.dart';

class FilmCatalogApp extends State<MyList> {
  final String apikey = "fa35d40a";
  final String urlRequest = "omdbapi.com";
  String data = "";
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

        if (json['Response'] == 'True') {
          var listeFilms = json['Search'] as List<dynamic>;
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
          newFilms.sort((a, b) {
            try {
              if (int.parse(a.year) > int.parse(b.year)) {
                return 1;
              }
              return -1;
            }catch (e){
              return 0;
            }
          });
        } else if (json['Error'] != null) {
          data = "Error : ${json['Error']}";
          print(data);
        } else {
          data = "Error in api request";
        }
        print(data);
      } catch (ex) {
        data = "Internet error : " + ex.toString();
      } finally {
        refresh();
        client.close();
      }
    }
    request();
    print(newFilms.length);
  }

  Future refresh() async {
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
                    onSubmitted: (value) => sendRequest(value),
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
