import 'package:flutter/material.dart';
import '../api/http.dart';
import '../components/songListDetailDesc.dart';
import '../styles/musicUI.dart';
import '../components/songList.dart';

class SongListDetail extends StatefulWidget {
  int songId;
  SongListDetail({required this.songId}):super();
  @override
  State<StatefulWidget> createState() {
    return SongListDetailState(songId: this.songId);
  }

}
class SongListDetailState extends State<SongListDetail> {
  int songId;
  SongListDetailState({required this.songId});
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
        title: const Text('歌单'),
        backgroundColor: MusicUI.colorGreen,
      ),
      body: Column(
        children: [
            SongListDesc(),
            SongList(),
        ],
      ),
    );
  }

}