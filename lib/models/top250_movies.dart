import 'package:imdb_movies/models/items.dart';

class Top250Movies {
  Top250Movies({
    required this.items,
    required this.errorMessage,
  });

  List<Item> items;
  String errorMessage;

  factory Top250Movies.fromJson(Map<String, dynamic> json) => Top250Movies(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}
