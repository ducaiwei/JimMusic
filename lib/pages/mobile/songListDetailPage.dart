import 'package:flutter/material.dart';
import '../../styles/musicUI.dart';
import '../../components/musicList.dart';
import '../../model/musicModel.dart';
import '../../model/songListDetail.dart';
import '../../api/request.dart';
import '../../components/playlistFlexibleAppBar.dart';
import '../../components/loadingWidget.dart';

class SongListDetailPage extends StatefulWidget {
  int songId;
  SongListDetailPage({super.key, required this.songId});
  @override
  State<StatefulWidget> createState() {
    return SongListDetailPageState();
  }
}
class _PlayListHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: InkWell(
        onTap: () {

        },
        child: SizedBox.fromSize(
          size: preferredSize,
          child: Row(
            children: [
              const SizedBox(width: 16,),
              SizedBox.square(
                dimension: 24,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.play_circle,
                      color: MusicUI.colorDeepRed,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8,),
              const Text(
                '播放全部',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

}
class PlayListAppBar extends StatelessWidget {
  PlayListAppBar({Key? key, required this.detail}): super(key:key);
  final double kHeaderHeight = 280 + MusicUI.kToolbarHeight;
  final SongListDetail detail;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      backgroundColor: Colors.transparent,
      expandedHeight: kHeaderHeight,
      flexibleSpace: PlaylistFlexibleAppBar(detail: detail),
      bottom: _PlayListHeader(),
    );
  }

}
class SongListDetailPageState extends State<SongListDetailPage> {
  List<MusicModel> musicList = [];
  @override
  void initState() {
    super.initState();
    getDetail();
  }
  Future<SongListDetail> getDetail() async {
    return await MusicRequest.playListDetail(widget.songId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LoadingWidget(loadFn:getDetail, builder: (ctx, detail) => CustomScrollView(
        slivers: [
          PlayListAppBar(detail: detail),
          Musiclist(songId: widget.songId),
        ],
      ),
        height: MediaQuery.of(context).size.height,
      ),
    );
  }

}