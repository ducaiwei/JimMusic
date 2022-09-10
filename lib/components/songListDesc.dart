import 'package:flutter/material.dart';
import '../styles/musicUI.dart';
import './circleButton.dart';

/// 歌单详情
class SongListDesc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SongListDescState();
}
class SongListDescState extends State<SongListDesc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: MusicUI.colorGreen,
      ),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 0,
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network('https://p1.music.126.net/TCggwwBfE33obl7nZAQoRg==/109951165629612076.jpg'),
                    ),
                  )
              ),
              Expanded(
                child: Container(
                  height: 100,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10.0),
                  child: const Text(
                    '旋律说唱旋律说唱旋律说唱旋律说唱旋旋律说唱旋律说唱唱',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              '23232323232323232323232323232323232323232323232',
              style: TextStyle(
                color: MusicUI.colorWhite,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(type: 'share', text: '22'),
              CircleButton(type: 'comment', text: '22'),
              CircleButton(type: 'favorite', text: '22'),
            ],
          )
        ],
      )
    );
  }
  
}