
import 'package:jimmusic/model/songListModel.dart';

part 'musicResponseSerializable.dart';

class MusicResponse {
  bool? hasTaste;
  int? code;
  int? category;
  List<SongListModel>? result;
  MusicResponse(this.hasTaste, this.code, this.category, this.result);

  factory MusicResponse.fromJson(Map<String, dynamic> json) => _MusicResponseFromJson(json);
}