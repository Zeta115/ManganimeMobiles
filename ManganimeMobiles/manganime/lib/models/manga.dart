class Manga {
  int? id, chapters;
  String title, synopsis, image, type, status;
  bool favourite;

  Manga.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        title = json["title"],
        image = json["images"]["jpg"]["image_url"],
        type = json["type"],
        chapters = json["chapters"],
        synopsis = json["synopsis"] ??
            "No synopsis information has been added to this title.",
        status = json["status"],
        favourite = false;
}
