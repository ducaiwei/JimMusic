import 'dart:async';
import 'dart:io';
import 'package:jimmusic/model/musicModel.dart';
import 'package:jimmusic/model/songListDetail.dart';
import 'package:netease_music_api/netease_cloud_music.dart' as api;
import 'package:async/async.dart' show Result, ErrorResult;
import 'package:cookie_jar/cookie_jar.dart';
import 'error.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../model/songListModel.dart';
import '../model/newMusicModel.dart';




class MusicApi {
  final api_Host = 'http://music.163.com';
  final reqSuccessCode = 200;
  final isLoginCode = 301;
  final Completer<PersistCookieJar> _cookieJar = Completer();
  late final cookiePath;

  MusicApi() {
    scheduleMicrotask(() async {
      var documentDir = (await getApplicationDocumentsDirectory()).path;
      if (Platform.isLinux || Platform.isWindows) {
        documentDir = p.join(documentDir, 'jimMusic');
      }
      cookiePath = p.join(documentDir, 'cookie');
      PersistCookieJar cookieJar;
      cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));
      _cookieJar.complete(cookieJar);
    });
  }
  /// 获取cookie
  Future<List<Cookie>> loadCookies() async {
    final jar = await _cookieJar.future;
    final uri = Uri.parse(api_Host);
    return jar.loadForRequest(uri);
  }
  /// 保存cookie
  Future saveCookies(List<Cookie> cookies) async {
    final jar = await _cookieJar.future;
    final uri = Uri.parse(api_Host);
    await jar.saveFromResponse(uri, cookies);
  }

   Future<Result<Map<String, dynamic>>> request(String path, [Map param = const {},]) async {
    late api.Answer result;
    try {
      final parameter = param.map((key, value) => MapEntry(key.toString(), value.toString()));
      final List<Cookie> cookies =  await loadCookies();
      result = await api.cloudMusicApi(
        path,
        parameter: parameter,
        cookie: cookies,
      );
    } catch(e, stack) {
      final result = ErrorResult(e, stack);
      return result;
    }
    if (result.status == reqSuccessCode) {
      await saveCookies(result.cookie);
    }
    final body = result.body;
    /// 需要登陆才能访问
    if (body['code'] == isLoginCode) {
      final error = ErrorResult(
          RequestError(
            code: body['code'],
            message: '请先登陆'
          ),
      );
      return error;
    } else if (body['code'] != reqSuccessCode) {
      final error = ErrorResult(
        RequestError(
          code: body['code'],
          message: body['msg'] ?? body['message'] ?? '请求出错',
        ),
      );
      return error;
    }
    return Result.value(body as Map<String, dynamic>);
   }
   R convertMap<R>(Result<Map<String, dynamic>> source,  R Function(Map<String, dynamic> t) fn) {
    return fn(source.asValue!.value);
   }
   /// 推荐歌单
   Future<List<SongListModel>> personalizedPlaylist(int limit, int offset)  async {
      final res = await request(
        '/personalized',
        {
          'limit': limit,
          'offset': offset,
        }
      );
      final result = convertMap(res, (res) {
        List<SongListModel> list = [];
        for (var item in res['result']){
          list.add(SongListModel.fromJson(item));
        }
        return list;
      });
      return result;
   }
   /// 推荐新歌
   Future<List<NewMusicModel>> newSongs() async {
    final response = await request('/personalized/newsong');
    return convertMap(response, (res) {
      List<NewMusicModel> list = [];
      for (var item in res['result']){
        list.add(NewMusicModel.fromJson(item));
      }
      return list;
    });
   }
   /// 歌单详情
   Future<SongListDetail> playListDetail(int id) async {
    final response = await request('/playlist/detail', {'id': id});
    return convertMap(response, (res) {
      return SongListDetail.fromJson(res['playlist']);
    });
   }
   /// 歌单所有歌曲
   playListTrackAll(int id) async {
     final response = await request('/playlist/detail', {'id': id});
     return convertMap(response, (res) {
       List<MusicModel> list = [];
       for (var item in res['playlist']['tracks']){
         list.add(MusicModel(item['name'], item['al']['picUrl'], item['ar'][0]['name'], item['dt'], item['al']['name']));
       }
       return list;
     });
   }
   /// 每日推荐歌曲 需要登陆
   recommandSongs() async {
      final response = await request('/recommend/songs');
   }
   /// 手机号登陆
   Future<Result<Map>> loginByPhone(String phone, String password) async {
     final reponse = await request('/login/cellphone', {phone: phone, password: password});
     return reponse;
   }
}