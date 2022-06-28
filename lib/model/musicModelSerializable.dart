
part of 'musicModel.dart';

MusicModel _MusicModelFromJson(dynamic json) => MusicModel(
  json['id'] as int,
  json['type'] as int,
  json['name'] as String,
  json['copywriter'] as String,
  json['picUrl'] as String,
  json['canDislike'] as bool,
  json['trackNumberUpdateTime'] as int,
  json['playCount'] as int,
  json['trackCount'] as int,
  json['highQuality'] as bool,
  json['alg'] as String,
);