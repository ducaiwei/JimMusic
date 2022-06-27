import 'dart:io';
import 'dart:convert';
import '../model/musicModel.dart';
import '../model/musicResponse.dart';

class MusicHttp {
    static const String url = 'https://netease-music-6acxc0sy9-ducaiwei.vercel.app/';
    static var httpClient = new HttpClient();
    static Future<MusicResponse<MusicModel>> parseReponse(response) async {
        if (response.statusCode == HttpStatus.OK) {
            var json = await response.transform(utf8.decoder).join();
            var data = jsonDecode(json) as MusicResponse<MusicModel>;
            return data;
        }
        return new MusicResponse(false, response.statusCode, 0, []);
    }
    /// 推荐歌单
    static getPersonalized()  async {
        const String path = url + 'personalized';
        MusicResponse<MusicModel> res;
        try {
            print('==============');
            var request = await httpClient.getUrl(Uri.parse(path));
            print('++++++++++++++++');
            var response = await request.close();
            print('------------------');
            res = await parseReponse(response);
            print('res===============');
            return res;
        }catch(exception){
            print('exception $exception');
        }

    }
}

