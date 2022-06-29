import 'package:flutter/material.dart';
import 'package:jimmusic/model/musicModel.dart';
import '../api/http.dart';
import '../styles/musicUI.dart';


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
      this.pageData = data;
    });
  }
  HomePageState() {
    initData();
  }
  List<Widget> _listView() {
    return this.recommendList.map((music) => Container(
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child:  Container(
                  height: 165.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(music.picUrl),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                    )
                  ),
                ),
              )
            ],
          ),

          // Image.network(music.picUrl),
        ],
      ),
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: GridView.count(
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: _listView(),
      ),
    );
  }

}