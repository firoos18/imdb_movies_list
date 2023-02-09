class TitleSpecific {
  TitleSpecific({required this.awards, required this.plot});

  String plot;
  String awards;

  factory TitleSpecific.fromJson(Map<String, dynamic> json) => TitleSpecific(
        plot: json["plot"],
        awards: json["awards"],
      );
}
