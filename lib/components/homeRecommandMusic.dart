
import 'package:flutter/material.dart';
import '../model/musicModel.dart';
import '../styles/musicUI.dart';
import './loadingWidget.dart';
import '../../model/newMusicModel.dart';
import '../../api/request.dart';



/// 首页每日推荐歌曲
class HomeRecommandMusics extends StatefulWidget {
  final Function toPlay;
  const HomeRecommandMusics({
    Key? key, required this.toPlay,
  }):super(key: key);
  @override
  State<StatefulWidget> createState() => HomeRecommandMusicsState();

}
class HomeRecommandMusicsState extends State {
  late List<MusicModel> list;
  Future<List<NewMusicModel>> getRecommandMusicList() async {
    var data = await MusicRequest.newSongs();
    List<NewMusicModel> result = data ?? [];
    return result;
  }
  List<Widget> renderListItem(list, widget) {
    List<Widget> widgets = [];
    list.asMap().forEach((index, item) {
      widgets.add(
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: MusicUI.flutterWhite,
                  ),
                ),
              ),
              Expanded(
                  flex: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          color: MusicUI.flutterWhite,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        item.authorName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          color: MusicUI.colorRgbaWhite,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    widget.toPlay(item);
                  },
                  child: Icon(
                    Icons.play_circle,
                    color: MusicUI.colorDeepRed,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
    return widgets;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '新歌推荐',
                  style: TextStyle(
                    color: MusicUI.flutterWhite,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          LoadingWidget(loadFn: getRecommandMusicList, builder: (ctx, list) => Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: renderListItem(list, widget),
            ),
          ),height: 200,)
        ],
      ),
    );
  }

}