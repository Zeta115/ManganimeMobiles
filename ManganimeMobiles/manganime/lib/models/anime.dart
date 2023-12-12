class Anime {
  int id, episodes, popularity;
  String title, synopsis, image, background, trailer, status;
  bool favourite;

  Anime.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        title = json["title"],
        image = json["images"]["jpg"]["image_url"],
        background = json["background"],
        synopsis = json["synopsis"],
        episodes = json["episodes"],
        trailer = json["trailer"]["youtube_id"],
        status = json["status"],
        popularity = json["popularity"],
        favourite = false;
}
