import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/models/popular_movies.dart';
import 'package:movie_app/ui/widgets/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? popularMovies;

  @override
  void initState() {
    super.initState();
    getPopularMovies();
  }

  getPopularMovies() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=8ace14f52e7963ff835c51bbf1e7393f&language=en-US&page=1");
    var response = await http.get(url);
    // TODO: use status code
    var responseBody = jsonDecode(response.body);
    popularMovies = responseBody["results"]
        .map((map) => PopularMovies.fromJson(map))
        .toList();
    // print(responseBody["results"][0]["original_title"]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (popularMovies == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return listItemWidget(popularMovies![index]);
                  },
                  childCount: popularMovies!.length,
                ))
              ],
            ),
    );
  }

  Widget listItemWidget(PopularMovies popularMovies) {
    return GestureDetector(
      //or InkWell
      onTap: () {
        goToDetailPage();
      },

      child: Stack(
        children: [
          Image.network(
            popularMovies.imageUrl,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(popularMovies.name),
          ),
        ],
      ),
    );
  }

  void goToDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const DetailPage();
        },
      ),
    ).then((value) {
      // ignore: avoid_print
      print("döndü");
    });
    // ignore: avoid_print
    print("gidiyoor");
  }
}
