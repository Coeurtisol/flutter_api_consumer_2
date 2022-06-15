class Acteur {
  late int id;
  late String name;
  late bool adult;
  late double popularity;
  late String? profil_path;

  Acteur({
    required this.id,
    required this.name,
    required this.adult,
    required this.popularity,
    required this.profil_path,
  });

  Acteur.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adult = json['adult'];
    popularity = json['popularity'];
    profil_path = json['profil_path'];
  }
}
