part of 'musicResponse.dart';


MusicResponse _MusicResponseFromJson(Map<String, dynamic> json) => MusicResponse(
  json['hasTaste'] as bool,
  json['code'] as int,
  json['category'] as int,
  json['result'] as List<MusicModel>,
);