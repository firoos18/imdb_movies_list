import 'package:http/http.dart' as http;
import 'package:imdb_movies/models/actor_specific.dart';
import 'dart:convert';
import 'package:imdb_movies/models/items.dart';
import 'package:imdb_movies/models/title_specific.dart';

String url = 'https://imdb-api.com/en/API/';

class ApiService {
  Future getRequest() async {
    try {
      final response =
          await http.get(Uri.parse('${url}Top250Movies/k_011jfn5i'));

      if (response.statusCode == 200) {
        Iterable it = (jsonDecode(response.body))['items'];
        List<Item> item = it.map((e) => Item.fromJson(e)).toList();
        return item;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future getTitleSpecific(String title) async {
    try {
      final response =
          await http.get(Uri.parse('${url}Title/k_011jfn5i/$title'));

      if (response.statusCode == 200) {
        final titleSpecific = TitleSpecific.fromJson(jsonDecode(response.body));

        return titleSpecific;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<List<ActorSpecific>> getActorsSpecific(String title) async {
    final response =
        await http.get(Uri.parse('${url}FullCast/k_011jfn5i/$title'));

    if (response.statusCode == 200) {
      print(json.decode(response.body)['actors']);

      Iterable actors = (jsonDecode(response.body)['actors']);
      List<ActorSpecific> actor =
          actors.map((e) => ActorSpecific.fromJson(e)).toList();
      return actor;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future getActorProfile(String name) async {
    final response = await http.get(Uri.parse('${url}Name/k_011jfn5i/$name'));

    if (response.statusCode == 200) {
      final actorProfile = ActorSpecific.fromJson(json.decode(response.body));

      return actorProfile;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
