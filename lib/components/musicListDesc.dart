import 'package:flutter/material.dart';
import '../styles/musicUI.dart';

/// 歌单详情
class MusicListDesc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MusicListDescState();
}
class MusicListDescState extends State<MusicListDesc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: MusicUI.colorGreen,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 0,
            child: Container(
              width: 100,
              height: 100,
              child: Card(
                child: Image.network('https://p1.music.126.net/TCggwwBfE33obl7nZAQoRg==/109951165629612076.jpg'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            )
          ),
          Expanded(
            child: Container(
              child: Text(
                '旋律说唱',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
}