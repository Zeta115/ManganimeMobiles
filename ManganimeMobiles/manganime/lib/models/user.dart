class User2 {
  int id;
  String name, image, about;

  User2.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        about = json["about"],
        image = json["images"]["jpg"]["image_url"],
        name = json["name"];
}
