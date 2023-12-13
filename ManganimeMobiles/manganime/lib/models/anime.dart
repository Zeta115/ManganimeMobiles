class Anime {
  int id, episodes, popularity;
  String title, synopsis, image, type, trailer, status;
  bool favourite;

  Anime.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        title = json["title"],
        image = json["images"]["jpg"]["image_url"],
        type = json["type"],
        synopsis = json["synopsis"] ?? "No synopsis information has been added to this title.",
        episodes = json["episodes"],
        trailer = json["trailer"]["youtube_id"],
        status = json["status"],
        popularity = json["popularity"],
        favourite = false;
}
