import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String id;
  final String? title;
  final bool posterPath;
  final bool overview;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
    };
  }

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
