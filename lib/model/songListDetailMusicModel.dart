
import './musicModel.dart';

/// 歌单详情->歌曲列表model
class SongListDetailMusicModel extends MusicModel {
  SongListDetailMusicModel(super.name, super.picUrl, super.authorName, super.dt, super.alName);
  factory SongListDetailMusicModel.fromJson(Map<String, dynamic> json) {
    return SongListDetailMusicModel(json['name'], json['al']['picUrl'], json['al']['name'], json['dt'],  json['al']['name']);
  }
}