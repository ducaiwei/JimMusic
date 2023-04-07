import 'package:flutter/material.dart';
import '../model/songListModel.dart';
import '../api/api.dart';
import 'package:auto_animated/auto_animated.dart';
import '../animation/animationUtil.dart';

/// 推荐歌单列表
class RecommandList extends StatefulWidget{
  const RecommandList({Key? key}): super(key: key);
  @override
  State<StatefulWidget> createState() => RecommandListState();
}

class RecommandListState extends State<RecommandList> {
  final ScrollController _controller = ScrollController();
  List<SongListModel> recommendList = [];
  int pageSize = 10;
  int page = 1;
  bool isLoading = false;
  final musicApi = MusicApi();
  void initData() async {
    var offset = pageSize * (page - 1);
    var data = await musicApi.personalizedPlaylist(pageSize, offset);
    var recommendList = data ?? [];
    setState(() {
      this.recommendList = recommendList;
    });
  }
  void initController() { /// 初始化滚动controller
    _controller.addListener(() async {
      if (_controller.offset >= _controller.position.maxScrollExtent) { /// 当前视图已经滚动到底部
        page = page + 1;
        var offset = pageSize * (page - 1);
        var data = await musicApi.personalizedPlaylist(pageSize, offset);
        List<SongListModel> list = data ?? [];
        setState(() {
          var recommendList = this.recommendList;
          recommendList.addAll(list);
          this.recommendList = recommendList;
        });
      }
    });
  }
  RecommandListState(){
    initData();
    initController();
  }

  @override
  Widget build(BuildContext context) {
    return  LiveGrid(
      itemCount: recommendList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: animationItemBuilder(
              (index) {
                return MusicCard(songList: recommendList[index]);
              }),
      controller: _controller,
    );
  }
}