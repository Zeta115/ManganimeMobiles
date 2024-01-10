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
        type = json["type"] ?? "<unknown>",
        source = json["source"],
        studio = json["studios"].length > 0 ? json["studios"][0]["name"] : "<unknown>",
        date = (json["aired"]["from"] != null) ? json["aired"]["from"].substring(0, json["aired"]["from"].indexOf('T')) : "<unknown>",
        rating = json["rating"] ?? "RG - 13",
        synopsis = json["synopsis"] ??
            "No synopsis information has been added to this title.",
        genres = (json["genres"] as List)
            .map((e) => e["name"])  // 
            .cast<String>()
            .toList(),
        episodes = json["episodes"] ?? 0,
        trailer = json["trailer"]["youtube_id"] ?? "<unknown>",
        status = json["status"],
        popularity = json["popularity"] ?? 0,
        score = json["score"] ?? 0,
        scoredBy = json["scored_by"] != null ? (json["scored_by"] as int).toDouble() : 0,
        favourite = false;
}

class Genre {
  int id;
  String name;
  Genre()
      : id = 0,
        name = "";
}
