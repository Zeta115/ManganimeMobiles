class User {
  int? id;
  String name, image, about, name_kanji;

  User({
    required this.id,
    required this.name,
    required this.image,
    required this.about,
    required this.name_kanji,
  });

  // Constructor por defecto
  User.defaultUser()
      : id = 0,
        name = '',
        image = '',
        about = '',
        name_kanji = '';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["mal_id"],
      about: json["about"],
      image: json["images"]["jpg"]["image_url"],
      name: json["name"],
      name_kanji: json["name_kanji"],
    );
  }
}
