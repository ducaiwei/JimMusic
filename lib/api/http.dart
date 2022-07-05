import 'dart:io';
import 'dart:convert';
import '../model/musicModel.dart';
import '../model/musicResponse.dart';

class MusicHttp {
    static const String url = 'https://netease-music-6acxc0sy9-ducaiwei.vercel.app/';
    static var httpClient = new HttpClient();
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
        const String path = url + 'personalized?limit=10';
        var request = await httpClient.getUrl(Uri.parse(path));
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
}

