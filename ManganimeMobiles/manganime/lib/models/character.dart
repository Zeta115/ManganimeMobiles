class Acharacter {
  int id;
  String name, image, nick;

  Acharacter.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        image = json["images"]["jpg"]["image_url"],
        name = json["name"],
        nick = json['nicknames'];
}
