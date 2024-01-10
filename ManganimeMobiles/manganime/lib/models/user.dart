class User {
  int id;
  String name, image, about, name_kanji;

  User.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        about = json["about"],
        image = json["images"]["jpg"]["image_url"],
        name = json["name"],
        name_kanji = json["name_kanji"];
}
