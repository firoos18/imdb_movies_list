import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:imdb_movies/models/items.dart';

String url = 'https://imdb-api.com/en/API/Top250Movies/k_011jfn5i';

class ApiService {
  Future getRequest() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable it = (jsonDecode(response.body))['items'];
        List<Item> item = it.map((e) => Item.fromJson(e)).toList();
        print(item);
        return item;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
