class Anime {
  int id, episodes, popularity;
  double score, scoredBy;
  String title,
      synopsis,
      image,
      type,
      trailer,
      status,
      studio,
      date,
      rating,
      source;
  bool favourite;
  //List<Studio> studios;
  List<String> genres;
  //List<Genre> genres;

  Anime.fromJson(Map<String, dynamic> json)
      : id = json["mal_id"],
        title = json["title"],
        image = json["images"]["jpg"]["image_url"],
        type = json["type"],
        source = json["source"],
        studio = json["studios"][0]["name"],
        date = json["aired"]["from"],
        rating = json["rating"],
        synopsis = json["synopsis"] ??
            "No synopsis information has been added to this title.",
        genres = (json["genres"] as List)
            .map((e) => e["name"])  // 
            .cast<String>()
            .toList(),
        episodes = json["episodes"],
        trailer = json["trailer"]["url"] ?? "-",
        status = json["status"],
        popularity = json["popularity"],
        score = json["score"] ?? 0,
        scoredBy = json["scored_by"] ?? 0,
        favourite = false;
}

class Genre {
  int id;
  String name;
  Genre()
      : id = 0,
        name = "";
}
