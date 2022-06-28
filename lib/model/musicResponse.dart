
import 'package:jimmusic/model/musicModel.dart';

part 'musicResponseSerializable.dart';

class MusicResponse {
  bool? hasTaste;
  int? code;
  int? category;
  List<MusicModel>? result;
  MusicResponse(this.hasTaste, this.code, this.category, this.result);

  factory MusicResponse.fromJson(Map<String, dynamic> json) => _MusicResponseFromJson(json);
}