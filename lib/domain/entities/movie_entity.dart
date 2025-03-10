import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final double popularity;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.popularity,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'popularity': popularity,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        overview,
        popularity,
      ];
}
