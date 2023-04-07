part 'songListDetailSerializable.dart';

class SongListDetail {
  String name;
  String description;
  String coverImgUrl;
  int subscribedCount;
  SongListDetail(this.name, this.description, this.coverImgUrl, this.subscribedCount);
  factory SongListDetail.fromJson(Map<String, dynamic> json) => _SongListDetailModelFromJson(json);
}