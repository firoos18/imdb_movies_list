class ActorSpecific {
  ActorSpecific({
    required this.id,
    required this.image,
    required this.name,
    required this.asCharacter,
  });

  String id;
  String image;
  String name;
  String asCharacter;

  factory ActorSpecific.fromJson(Map<String, dynamic> json) => ActorSpecific(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        asCharacter: json["asCharacter"],
      );
}
