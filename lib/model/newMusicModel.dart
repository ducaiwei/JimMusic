
import './musicModel.dart';

class NewMusicModel extends MusicModel {

  NewMusicModel(super.name, super.picUrl, super.authorName, super.dt, super.alName);
  factory NewMusicModel.fromJson(Map<String, dynamic> json) {
    return NewMusicModel(json['name'], json['picUrl'], json['song']['artists'][0]['name'], 0, '');
  }
}
