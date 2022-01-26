import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/models/popular_movies.dart';
import 'package:movie_app/ui/widgets/detail_page.dart';
// import 'package:movie_app/ui/widgets/homepage_list_item.dart';

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
    // TODO: add language option
    var response = await http.get(url);
    // TODO: use status code
    var responseBody = jsonDecode(response.body);
    popularMovies = responseBody["results"]
        .map((map) => PopularMovies.fromJson(map))
        .toList();
    setState(() {});
    // print(responseBody["results"][0]["original_title"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Popular Movies"),
        ),
      ),
      body: (popularMovies == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return gridItemWidget(popularMovies![index]);
                    },
                    childCount: popularMovies!.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ],
            ),
    );
  }

  Widget gridItemWidget(PopularMovies popularMovies) {
    return InkWell(
      onTap: () {
        goToDetailPage();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Image.network(
                'https://image.tmdb.org/t/p/original' + popularMovies.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(popularMovies.name),
                ),
              ),
            ],
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
