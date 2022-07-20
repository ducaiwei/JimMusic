import 'package:flutter/material.dart';
import 'package:jimmusic/model/musicModel.dart';
import '../api/http.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();
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
  void initController() {
    _controller.addListener(() {
      print(_controller.offset);
    });
  }
  HomePageState() {
    initController();
    initData();
  }
  List<Widget> _listView() {
    List<Widget> widgets = [];
    if (this.recommendList.length > 0) {
      this.recommendList.forEach((element) {
        widgets.add(Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                  Radius.circular(15))
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(15)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(16.0),
                color: Colors.grey,
              ),
              child: Image.network(element.picUrl),
            ),
          ),
        ));
      });
    }
    return widgets;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        children: _listView(),
        controller: _controller,
      )
    );
  }
}