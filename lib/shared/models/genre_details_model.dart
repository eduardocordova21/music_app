import 'package:music_app/shared/models/genre_model.dart';

import 'music_model.dart';

class GenreDetailsModel extends GenreModel {
  final List<MusicModel> musics;

  GenreDetailsModel(
      {required super.title,
      required super.searchString,
      super.img,
      required this.musics});

  factory GenreDetailsModel.fromMap(Map<String, dynamic> map) {
    return GenreDetailsModel(
      title: map["title"] ?? "",
      searchString: map["searchString"] ?? "",
      musics: (map["musics"] as List)
          .map((music) => MusicModel.fromMap(music))
          .toList(),
      img: map["img"] ?? "",
    );
  }
}
