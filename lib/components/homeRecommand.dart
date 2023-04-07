
import 'package:flutter/material.dart';
import '../styles/musicUI.dart';
import '../model/songListModel.dart';
import './lazyImage.dart';
import '../api/request.dart';
import './loadingWidget.dart';

/// 首页推荐歌单模块
class HomeRecommand extends StatefulWidget {
  final Function() toSongList;
  final Function(int id) toDetail;
  const HomeRecommand({Key? key, required this.toSongList, required this.toDetail}): super(key: key);
  @override
  State<StatefulWidget> createState()  => HomeRecommandState();

}
class HomeRecommandState extends State {
   // late final List<SongListModel> list;
  @override
  void initState() {
    super.initState();
  }
  @override
  HomeRecommand get widget => super.widget as HomeRecommand;

   Future<List<SongListModel>> getRecommandList() async {
    var data = await MusicRequest.personalizedPlaylist(6, 1);
    List<SongListModel> result = data ?? [];
    return result;
  }
  List<Widget> renderChildren(List<SongListModel> list, BuildContext context) {
    List<Widget> widgets = [];
    if (list.isNotEmpty) {
      list.forEach((item) {
        widgets.add(
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(widget.toDetail(item.id));
            },
            child: Container(
              width: 112,
              child:  Column(
                children: [
                  SizedBox(
                      width:112,
                      height: 112,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: LazyImage(imgUrl: item.picUrl),
                      )
                  ),
                  Text(
                    item.name,
                    style: TextStyle(
                      color: MusicUI.flutterWhite,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      });
    }
    return widgets;
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(widget.toSongList());
              },
              child:  Row(
                children: [
                  Text(
                    '推荐歌单',
                    style: TextStyle(
                      color: MusicUI.flutterWhite,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: MusicUI.flutterWhite,
                  ),
                ],
              ),
            )
        ),
        LoadingWidget(loadFn: getRecommandList, builder: (ctx, list) => Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: renderChildren(list, ctx),
        ),
          height: 200,
        ),
      ],
    );
  }
}