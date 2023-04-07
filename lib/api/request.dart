import './api.dart';
import '../model/songListModel.dart';
import 'package:async/async.dart' show Result;


class MusicRequest {
  static var musicApi;
  static initApi() {
    musicApi = MusicApi();
  }
  /// 推荐歌单
  static Future<List<SongListModel>> personalizedPlaylist(int limit, int offset)  async {
    if (musicApi == null) initApi();
    return musicApi.personalizedPlaylist(limit, offset);
  }
  /// 推荐新歌
  static newSongs() async {
    if (musicApi == null) initApi();
    return musicApi.newSongs();
  }
  /// 歌单详情
  static playListDetail(int id) async {
    if (musicApi == null) initApi();
    return musicApi.playListDetail(id);
  }
  /// 歌单所有歌曲
  static playListTrackAll(int id ) async {
    if (musicApi == null) initApi();
    return musicApi.playListTrackAll(id);
  }
  /// 登陆
  static Future<Result<Map>> loginByPhone(String phone, String password) async {
    if (musicApi == null) initApi();
    return musicApi.loginByPhone(phone, password);
  }
}