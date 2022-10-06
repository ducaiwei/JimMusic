import 'dart:io';
import 'dart:convert';
import '../model/musicModel.dart';
import '../model/musicResponse.dart';
import '../model/songListDetail.dart';

class MusicHttp {
    static const String url = 'http://192.168.3.42:8888/';
    static var httpClient = new HttpClient();
    // Duration idleTimeout = const Duration(seconds: 50);
    static parseReponse(response) async {
        if (response.statusCode == HttpStatus.OK) {
            var json = await response.transform(utf8.decoder).join();
            var data = jsonDecode(json);
            return data;
        }
        return new MusicResponse(false, response.statusCode, 0, []);
    }
    /// 推荐歌单
    static getPersonalized()  async {
        const String path = url + 'songlist/personalized?limit=10';
        var request = await httpClient.getUrl(Uri.parse(path)).timeout(
            Duration(seconds: 100)
        );
        var response = await request.close();
        var res = await parseReponse(response);
        List<dynamic> musics = res['result'] ?? [];
        List<MusicModel> list = [];
        musics.forEach((dynamic item){
            list.add(MusicModel.fromJson(item));
        });
        res['result'] = list;
        var result = MusicResponse.fromJson(res);
        return result;
    }
    /// 获取歌单详情
    static Future<SongListDetailModel> getMusicListDetail(int id) async {
        String path = url + 'songlist/detail?id=' + id.toString();
        var request = await httpClient.getUrl(Uri.parse(path));
        var response = await request.close();
        var res = await parseReponse(response);
        return SongListDetailModel.fromJson(res['playlist']);
    }
}

