import 'package:flutter/material.dart';
import '../api/http.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  List<dynamic> recommendList = [];
  var pageData;
  void initData() async {
    var data = await MusicHttp.getPersonalized();
    var recommendList = data.result ?? [];
    setState(() {
      this.recommendList = recommendList;
      this.pageData = data;
    });
  }
  HomePageState() {
    initData();
  }
  List<Widget> _listView() {
    return this.recommendList.map((music) => Text(
      music.name,
      style: TextStyle(
        color: Colors.white
      ),
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: _listView(),
      ),
    );
  }

}