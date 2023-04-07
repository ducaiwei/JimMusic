import 'package:flutter/material.dart';
import 'package:jimmusic/components/homeRecommand.dart';
import 'package:jimmusic/pages/mobile/playingPage.dart';
import '../../components/homeHeadCard.dart';
import '../../components/homeRecommandMusic.dart';
import './recommandListPage.dart';
import './songListDetailPage.dart';
import 'dayRecommendPage.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HomeHeadCard(
            tapFunction: (item) {
              if (item.title == '每日推荐') {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_){
                    return DayRecommendPage();
                  },
                ));
              }
            },
          ),
          HomeRecommand(
            toSongList: () {
              return MaterialPageRoute(
                builder: (_){
                  return const RecommandListPage();
                },
              );
            },
            toDetail: (id) {
              return MaterialPageRoute(
                  builder: (_) {
                    return SongListDetailPage(songId: id);
                  }
              );
            },
          ),
          HomeRecommandMusics(
            toPlay: (item) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    print('===============');
                    print(item);
                    return PlayingPage(music: item);
                  }
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}