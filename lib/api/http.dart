import 'dart:io';
import 'dart:convert';

class MusicHttp {
    final String url = 'https://netease-music-6acxc0sy9-ducaiwei.vercel.app/';
    var httpClient = new HttpClient();
    /// 推荐歌单
    _getpersonalized() async {
        var request = await httpClient.getUrl(Uri.parse(url));
        var response = await request.close();
        print('=============', response);
    }
}

