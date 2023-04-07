part of 'songListDetail.dart';

SongListDetail _SongListDetailModelFromJson(Map<String, dynamic> json) => SongListDetail(
  json['name'] as String,
  json['description'] as String,
  json['coverImgUrl'] as String,
  json['subscribedCount'] as int,
);