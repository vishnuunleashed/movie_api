// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  Movie({
    this.id,
    this.rating,
    this.title,
    this.poster,
    this.overview,
    this.releaseDate,
    this.genres,
  });

  String? id;
  double? rating;
  String? title;
  String? poster;
  String? overview;
  int? releaseDate;
  List<String>? genres;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["id"],
    rating: json["rating"].toDouble(),
    title: json["title"],
    poster: json["poster"],
    overview: json["overview"],
    releaseDate: json["release_date"],
    genres: List<String>.from(json["genres"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rating": rating,
    "title": title,
    "poster": poster,
    "overview": overview,
    "release_date": releaseDate,
    "genres": List<dynamic>.from(genres!.map((x) => x)),
  };
}
