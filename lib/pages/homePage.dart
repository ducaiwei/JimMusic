import 'package:flutter/material.dart';
import 'package:jimmusic/model/musicModel.dart';
import '../api/http.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  List<MusicModel> recommendList = [];
  var pageData;
  void initData() async {
    var data = await MusicHttp.getPersonalized();
    var recommendList = data.result ?? [];
    setState(() {
      this.recommendList = recommendList;
      print('==================$recommendList');
      this.pageData = data;
    });
  }
  HomePageState() {
    initData();
  }
  Widget _listView(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
              Radius.circular(15))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(15)),
        child: Image.network(this.recommendList[index].picUrl),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        // scrollDirection: Axis.vertical,
        // children: _listView(),
        itemBuilder: (BuildContext context, int index) => _listView(context, index),
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(1, 1); // 固定纵轴和主轴上的数量
        },
      ),
    );
  }
}