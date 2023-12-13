class Manga {
  int id, popularity;
  String title, synopsis, image, type, status;
  bool favourite;

  Manga.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        title = json["title"],
        image = json["images"]["jpg"]["image_url"],
        type = json["type"],
        synopsis = json["synopsis"] ??
            "No synopsis information has been added to this title.",
        status = json["status"],
        popularity = json["popularity"],
        favourite = false;
}
