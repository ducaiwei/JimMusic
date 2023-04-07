import 'package:flutter/material.dart';
import '../styles/musicUI.dart';
import '../model/songListDetail.dart';
import './lazyImage.dart';
import '../api/request.dart';

/// 歌单详情描述
class SongListDesc extends StatefulWidget implements PreferredSizeWidget{
  final int songId;
  const SongListDesc({Key? key, required this.songId}):super(key: key);
  @override
  State<StatefulWidget> createState()  => SongListDescState();

  @override
  Size get preferredSize => const Size.fromHeight(240);
}

class SongListDescState extends State<SongListDesc> {
  SongListDetail detail = SongListDetail('', '', '', 0);
  @override
  void initState() {
    super.initState();
    getDetail();
  }
  void getDetail() async {
    var model = await MusicRequest.playListDetail(widget.songId) as SongListDetail;
    setState(() {
      detail = model;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox.fromSize(
        size: widget.preferredSize,
        child: Stack(
          children: [
            Container(
                height: 240,
                padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
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
                                child: LazyImage(imgUrl: detail.coverImgUrl),
                              ),
                            )
                        ),
                        Expanded(
                            child: Container(
                              height: 100,
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                detail.name,
                                style: const TextStyle(
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
                      child: Stack(
                        children: [
                          Text(
                            detail.description,
                            softWrap: true,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: MusicUI.colorWhite,
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            right: -5,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white54,
                              size: 18,
                            ),
                          ),

                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     CircleButton(type: 'share', text: '22'),
                    //     CircleButton(type: 'comment', text: '22'),
                    //     CircleButton(type: 'favorite', text: '22'),
                    //   ],
                    // )
                  ],
                )
            ),
            Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 0,
                    ),
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, .5),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 32,
                        ),
                        Text(
                          '播放全部',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
  
}