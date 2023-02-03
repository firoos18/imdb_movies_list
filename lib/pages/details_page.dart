import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final image;
  final title;
  final fullTitle;
  final year;
  final crew;
  final imDbRating;
  final rank;

  const DetailsPage(
      {super.key,
      required this.image,
      required this.title,
      required this.fullTitle,
      required this.year,
      required this.crew,
      required this.imDbRating,
      required this.rank});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(image),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fullTitle),
                    Text(year),
                    Text(rank),
                    Text('$imDbRating / 10'),
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
