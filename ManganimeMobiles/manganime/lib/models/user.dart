class User {
  int id;
  String name, image, about, nameKanji;

  User.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        about = json["about"],
        image = json["images"]["jpg"]["image_url"],
        name = json["name"],
        nameKanji = json["name_kanji"];
}
