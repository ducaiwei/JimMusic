import 'package:flutter/material.dart';
import '../model/songListModel.dart';
import '../pages/mobile/songListDetailPage.dart';

/// 歌单卡片
class MusicCard extends StatelessWidget {
  const MusicCard({
    required this.songList,
    Key? key,
  }) : super(key: key);

  final SongListModel songList;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
        Radius.circular(15))
      ),
      child: ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(15)),
        child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey,
      ),
      child: GestureDetector(
      onTap: (){
        Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => SongListDetailPage(songId: songList.id)));
      },
      child: Stack(
      children: [
        Image.network(songList.picUrl),
        Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container( // 歌单介绍
        height: 45,
        padding: const EdgeInsets.only(left: 5.0,right: 5.0,bottom: 0.0, top: 0.0),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0,.5),
        ),
        child: Center(
        child: Text(
          songList.name,
          softWrap: true,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          strutStyle: const StrutStyle(
            leading: 0,
            height: 1.1,
            forceStrutHeight: true,
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      ),
      ),
        Positioned( // 歌单图片
          right: 10.0,
          top: 10.0,
          child: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color:  const Color.fromRGBO(0, 0, 0, .2),
        ),
        child: Row(
        children: [
          Text(
            songList.playCount.toString(),
            style: const TextStyle(
            color: Colors.white,
          ),
          )
        ],
        ),
        ),
        ),
      ],
      ),
      ),
      ),
      ),
      );
  }
}

class HorizontalItem extends StatelessWidget {
  const HorizontalItem({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) => Container(
    width: 140,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Colors.white,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    ),
  );
}

/// Wrap Ui item with animation & padding
Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
    ) animationItemBuilder(
    Widget Function(int index) child, {
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        int index,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

Widget Function(
    BuildContext context,
    Animation<double> animation,
    ) animationBuilder(
    Widget child, {
      double xOffset = 0,
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(xOffset, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );