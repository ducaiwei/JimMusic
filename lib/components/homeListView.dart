import 'package:flutter/material.dart';
import 'package:jimmusic/model/musicModel.dart';
import '../api/http.dart';
import '../pages/songList.dart';

class HomeListView extends StatefulWidget{
  const HomeListView({Key? key}): super(key: key);
  @override
  State<StatefulWidget> createState() => HomeListViewState();

}

class HomeListViewState extends State<HomeListView> {
  final ScrollController _controller = ScrollController();
  List<MusicModel> recommendList = [];
  void initData() async {
    var data = await MusicHttp.getPersonalized();
    var recommendList = data.result ?? [];
    setState(() {
      this.recommendList = recommendList;
    });
  }
  void initController() {
    _controller.addListener(() {
      // print(_controller.offset);
    });
  }
  HomeListViewState(){
    initData();
    initController();
  }

  List<Widget> _listView() {
    List<Widget> widgets = [];
    if (recommendList.isNotEmpty) {
      for (var item in recommendList) {
        widgets.add(Container(
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                  Radius.circular(15))
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
                Radius.circular(15)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SongList(songId: item.id)));
                },
                child: Stack(
                  children: [
                    Image.network(item.picUrl),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container( // 歌单介绍
                        height: 45,
                        padding: const EdgeInsets.only(left: 5.0,right: 5.0,bottom: 0.0, top: 0.0),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0,.5),
                        ),
                        child: Center(
                          child: Text(
                            item.name,
                            softWrap: true,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            strutStyle: const StrutStyle(
                              leading: 0,
                              height: 1.1,
                              forceStrutHeight: true,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned( // 歌单图片
                      right: 10.0,
                      top: 10.0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color:  const Color.fromRGBO(0, 0, 0, .2),
                        ),
                        child: Row(
                          children: [
                            Text(
                              item.playCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      }
    }
    return widgets;
  }
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      controller: _controller,
      children: _listView(),
    );
  }
}