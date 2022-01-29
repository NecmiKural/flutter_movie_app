import 'package:flutter/material.dart';
import 'package:movie_app/models/popular_movies.dart';

class DetailPage extends StatefulWidget {
  PopularMovies? movies;
  // DetailPage({this.movies});
  DetailPage({Key? key, this.movies}) : super(key: key);
// https://discord.com/channels/145199608631394304/252814654114365441/936902226096562176

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Image.network('https://image.tmdb.org/t/p/original' +
                      widget.movies!.imageUrl),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      widget.movies!.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              Icons.calendar_today,
                              size: 25,
                            ),
                            Text(
                              "2004",
                              style: TextStyle(fontSize: 22),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Icon(Icons.remove_red_eye, size: 25),
                            Text("635274354 Watch"),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text(
                        "Veniam aliquip nulla deserunt sint culpa culpa velit enim sint minim aute. Cupidatat incididunt ea et pariatur esse irure aute qui amet magna dolore amet. Ea minim nisi reprehenderit sunt ipsum ex esse duis id sint nulla aliquip. Incididunt est proident ea voluptate mollit esse eiusmod qui in enim tempor commodo aliqua. Qui est exercitation aute pariatur cillum sunt quis consectetur magna laborum duis duis exercitation minim. Occaecat ex consectetur reprehenderit ipsum nostrud pariatur id qui ipsum. Aliqua nulla mollit sint laborum occaecat dolore in non sunt.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*
    ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.red),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text("Popular Movies")),
              actions: [
                IconButton(
                    icon: Icon(themeNotifier.value == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode),
                    onPressed: () {
                      themeNotifier.value =
                          themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    })
              ],
            ),
          ),
        );
      },
    );
*/
  }
}
