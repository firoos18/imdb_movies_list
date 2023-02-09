class ActorProfile {
  ActorProfile({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.summary,
  });

  String name;
  String role;
  String image;
  String summary;
  String id;

  factory ActorProfile.fromJson(Map<String, dynamic> json) => ActorProfile(
        name: json["name"],
        image: json["image"],
        role: json["role"],
        summary: json["summary"],
        id: json["id"],
      );
}
