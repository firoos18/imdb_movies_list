import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final image;
  final title;
  final year;
  final button;

  const MovieTile(
      {super.key,
      required this.image,
      required this.title,
      required this.year,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: year,
      leading: image,
      trailing: button,
    );
  }
}
