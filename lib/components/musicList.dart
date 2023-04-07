import 'package:flutter/material.dart';
import 'package:jimmusic/components/songListCard.dart';
import '../model/musicModel.dart';
import '../api/request.dart';

/// 歌单详情->歌曲列表
class Musiclist extends StatefulWidget implements PreferredSizeWidget{
  final int songId;
  const Musiclist({Key? key, required this.songId}):super(key: key);
  @override
  State<StatefulWidget> createState() => MusicListSate();

  @override
  Size get preferredSize => const Size.fromHeight(200);

}
class MusicListSate extends State<Musiclist> {
  final ScrollController _controller = ScrollController();
  List<MusicModel> musics = [];
  MusicListSate();
  @override
  void initState() {
    super.initState();
    // initController();
    getPlayList();
  }
  void getPlayList() async {
    var res = await MusicRequest.playListTrackAll(widget.songId);
    setState(() {
      musics = res;
    });
  }
  void initController() {
    _controller.addListener(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index){
        return SongListCard(music: musics[index]);
      }, childCount: musics.length),
    );
  }
  
}