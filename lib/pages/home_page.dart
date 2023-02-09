import 'package:flutter/material.dart';
import 'package:imdb_movies/components/movie_tile.dart';
import 'package:imdb_movies/models/items.dart';
import 'package:imdb_movies/pages/details_page.dart';
import 'package:imdb_movies/services/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> itemList = [];
  ApiService api = ApiService();

  getData() async {
    itemList = await api.getRequest();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Top 250 Movies by IMDb'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          if (itemList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MovieTile(
              image: Image.network(itemList[index].image),
              title: Text(itemList[index].title),
              year: Text(itemList[index].year),
              button: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      image: itemList[index].image,
                      title: itemList[index].title,
                      fullTitle: itemList[index].fullTitle,
                      year: itemList[index].year,
                      crew: itemList[index].crew,
                      imDbRating: itemList[index].imDbRating,
                      rank: itemList[index].rank,
                      id: itemList[index].id,
                    ),
                  ),
                ),
                child: const Icon(Icons.chevron_right),
              ),
            );
          }
        },
      ),
    );
  }
}
