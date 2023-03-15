class MyMoviesList {
  String id;
  int idFilm;

  MyMoviesList({ this.id="", required this.idFilm});

  MyMoviesList.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          idFilm: json['idFilm'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "idFilm": idFilm,
    };
  }
}
