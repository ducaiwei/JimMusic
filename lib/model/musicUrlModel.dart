
/// 音乐url model
class MusicUrlModel {
  String url; /// url地址
  num size; /// 大小
  num br; /// 码率
  MusicUrlModel(this.url, this.size, this.br);
  factory MusicUrlModel._fromJson(Map<String, dynamic> json) {
    return MusicUrlModel(json['url'], json['size'], json['br']);
  }
}