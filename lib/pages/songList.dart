import 'package:flutter/material.dart';
import '../api/http.dart';
import '../components/musicListDesc.dart';
import '../styles/musicUI.dart';

class SongList extends StatefulWidget {
  int songId;
  SongList({required this.songId}):super();
  @override
  State<StatefulWidget> createState() {
    return SongListState(songId: this.songId);
  }

}
class SongListState extends State<SongList> {
  int songId;
  SongListState({required this.songId});
  @override
  void initState() {
    super.initState();
    MusicHttp.getMusicListDetail(this.songId);
    MusicHttp.getMusicList(this.songId, 10, 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('歌单'),
        backgroundColor: MusicUI.colorGreen,
      ),
      body: Column(
        children: [
          MusicListDesc(),
        ],
      ),
    );
  }

}