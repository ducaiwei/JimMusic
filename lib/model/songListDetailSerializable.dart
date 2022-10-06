part of 'songListDetail.dart';

SongListDetailModel _SongListDetailModelFromJson(Map<String, dynamic> json) => SongListDetailModel(
  json['name'] as String,
  json['description'] as String,
  json['coverImgUrl'] as String,
  json['subscribedCount'] as int,
);