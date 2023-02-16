import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_movies/models/actor_specific.dart';
import 'package:imdb_movies/models/title_specific.dart';
import 'package:imdb_movies/services/http.dart';

class DetailsPage extends StatefulWidget {
  final id;
  final image;
  final title;
  final fullTitle;
  final year;
  final crew;
  final imDbRating;
  final rank;

  const DetailsPage({
    super.key,
    required this.image,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.crew,
    required this.imDbRating,
    required this.rank,
    required this.id,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<ActorSpecific> actorList = [];
  ApiService api = ApiService();

  getData() async {
    actorList = await api.getActorsSpecific(widget.id);
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
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.network(
                    widget.image,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.fullTitle),
                    Text(widget.year),
                    Text(widget.rank),
                    Text('${widget.imDbRating} / 10'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future: api.getTitleSpecific(widget.id),
              builder: (context, snapshot) {
                TitleSpecific titleSpecific;
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.plot,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Awards Achieved: ',
              style: GoogleFonts.montserrat(
                fontSize: 20,
              ),
            ),
            FutureBuilder(
              future: api.getTitleSpecific(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.awards,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: actorList.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                      actorList[index].name,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Image.network(actorList[index].image),
                    subtitle: Text(
                      actorList[index].asCharacter,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
