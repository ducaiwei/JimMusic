part 'musicModelSerializable.dart';

/**
 * 歌单详情
 */
class MusicModel {
  int id;
  int type;
  String name;
  // String copywriter;
  String picUrl;
  bool canDislike;
  int trackNumberUpdateTime;
  int playCount; /// 播放次数
  int trackCount;
  bool highQuality;
  String alg;
  MusicModel(this.id, this.type, this.name, this.picUrl, this.canDislike,
      this.trackNumberUpdateTime, this.playCount, this.trackCount, this.highQuality, this.alg);
  factory MusicModel.fromJson(dynamic json) => _MusicModelFromJson(json);
}