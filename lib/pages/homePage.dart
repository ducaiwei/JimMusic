import 'package:flutter/material.dart';
import '../api/http.dart';
import '../model/musicModel.dart';
import '../model/musicResponse.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  List<MusicModel> recommandList = [];
  MusicResponse<MusicModel> pageData = new MusicResponse(false, 200, 0 , []);
  void initData() async {
    print('pageData================');
    pageData = await MusicHttp.getPersonalized();
    print('pageData================');
    print(pageData);
    recommandList = pageData.result ?? [];
    print('recommandList=========');
    print(recommandList);
  }
  HomePageState() {
    initData();
  }
  @override
  Widget build(BuildContext context) {
    return Text('home');
  }

}