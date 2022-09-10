import 'dart:io';
import 'dart:convert';
import '../model/musicModel.dart';
import '../model/musicResponse.dart';
import '../model/musicListDetail.dart';

class MusicHttp {
    static const String url = 'http://192.168.2.214:3000/';
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
    /// 获取歌单歌曲列表
    static getMusicList(int id, int limit, int offset) async {
        String path = url + '/playlist/track/all?id=' + id.toString() + '&limit=' + limit.toString() + '&offset=' + offset.toString();
        var request = await httpClient.getUrl(Uri.parse(path));
        var response = await request.close();
        var res = await parseReponse(response);
        print('============$res');
    }
    /// 获取歌单详情
    static getMusicListDetail(int id) async {
        String path = url + 'playlist/detail?id=' + id.toString();
        var request = await httpClient.getUrl(Uri.parse(path));
        var response = await request.close();
        var res = await parseReponse(response);
        print('歌单详情============$res');

    }
}

