import 'package:flutter/material.dart';
import '../components/songListDetailDesc.dart';
import '../styles/musicUI.dart';
import '../components/songList.dart';
import '../model/songListDetail.dart';

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
            SongListDesc(songId: songId),
            SongList(),
        ],
      ),
    );
  }

}