part 'songListModelSerializable.dart';

/// 歌单
class SongListModel {
  int id;
  // int type;
  String name;
  // String copywriter;
  String picUrl;
  bool canDislike;
  int trackNumberUpdateTime;
  double playCount; /// 播放次数
  int trackCount;
  bool highQuality;
  String alg;
  SongListModel(this.id,this.name, this.picUrl, this.canDislike,
      this.trackNumberUpdateTime, this.playCount, this.trackCount, this.highQuality, this.alg);
  factory SongListModel.fromJson(dynamic json) => _SongListModelFromJson(json);
}