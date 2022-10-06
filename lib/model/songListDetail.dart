part 'songListDetailSerializable.dart';

class SongListDetailModel {
  String name;
  String description;
  String coverImgUrl;
  int subscribedCount;
  SongListDetailModel(this.name, this.description, this.coverImgUrl, this.subscribedCount);
  factory SongListDetailModel.fromJson(Map<String, dynamic> json) => _SongListDetailModelFromJson(json);
}