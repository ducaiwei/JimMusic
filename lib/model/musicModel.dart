
/// 歌曲model
class MusicModel {
  String name;
  String picUrl;
  String authorName;
  int dt; /// 播放时长
  String alName; /// 专辑名称
  MusicModel(this.name, this.picUrl, this.authorName, this.dt, this.alName);
}