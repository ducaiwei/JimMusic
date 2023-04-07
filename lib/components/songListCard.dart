
import 'package:flutter/material.dart';
import '../model/musicModel.dart';
import '../styles/musicUI.dart';
import '../utils/utils.dart';
import './cachedImage.dart';


// 歌单卡片
class SongListCard extends StatelessWidget {
  final MusicModel music;

  const SongListCard({Key? key, required this.music}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16,),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: CachedImage(music.picUrl),
                height:40,
                width: 40,
              ),
            ),
            const SizedBox(width: 16,),
             SizedBox(
               width: 260,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     music.name,
                     style: const TextStyle(
                         color: Colors.white,
                         fontSize: 15
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                   Text(
                     music.authorName + '-' + music.alName,
                     style: TextStyle(
                       color: MusicUI.colorRgbaWhite,
                       fontSize: 14
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ],
               ),
             ),
            Icon(
              Icons.play_circle,
              color: MusicUI.colorDeepRed,
            ),
          ],
    ),
      ),
    );
  }
}