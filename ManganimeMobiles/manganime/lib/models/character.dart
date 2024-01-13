class Character {
  int id;
  String name, image;

  Character.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        image = json["images"]["jpg"]["image_url"],
        name = json["name"];
}
