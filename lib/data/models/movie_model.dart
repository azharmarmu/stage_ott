import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.overview,
    required super.popularity,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
      overview: json['overview'],
      popularity: json['popularity'],
    );
  }
}
