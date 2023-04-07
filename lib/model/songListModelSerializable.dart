
part of 'songListModel.dart';

SongListModel _SongListModelFromJson(dynamic json) => SongListModel(
  json['id'] as int,
  // json['type'] as int,
  json['name'] as String,
  json['picUrl'] as String,
  json['canDislike'] as bool,
  json['trackNumberUpdateTime'] as int,
  json['playCount'] as double,
  json['trackCount'] as int,
  json['highQuality'] as bool,
  json['alg'] as String,
);