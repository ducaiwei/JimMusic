
import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../model/newMusicModel.dart';
import '../../components/cachedImage.dart';

class PlayingPage extends StatefulWidget {
  final NewMusicModel music;

  const PlayingPage({super.key, required this.music});
  @override
  State<StatefulWidget> createState() => PlayingPageState();
}
class _PlayBackground extends StatelessWidget {
  final String img;
  const _PlayBackground({super.key, required this.img});
  @override
  Widget build(BuildContext context) {
   return Stack(
     fit: StackFit.expand,
     children: [
        Image(
          image: CachedImage(img),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
       RepaintBoundary(
         child: BackdropFilter(
           filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
           child: ColoredBox(color: Colors.black.withOpacity(0.3)),
         ),
       ),
     ],
   );
  }
}
class _CenterContent extends StatefulWidget {
  final String img;
  final bool rotating;
  const _CenterContent({super.key, required this.img, required this.rotating});

  @override
  State<StatefulWidget> createState() => _CenterContentState();
}
class _CenterContentState extends State<_CenterContent> with SingleTickerProviderStateMixin{
  double rotation = 0;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
      setState(() {
        rotation = _controller.value * pi *2;
      });
    })..addStatusListener((status) {
      if (status == AnimationStatus.completed && _controller.value == 1) { // 动画循环执行
        _controller.forward(from: 0);
      }
    });
    if (widget.rotating) { // 动画开始执行
      _controller.forward(from: _controller.value);
    }
  }
  @override
  void didUpdateWidget(covariant _CenterContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.rotating) {
      _controller.forward(from: _controller.value);
    } else {
      _controller.stop();
    }
    if (oldWidget.img != widget.img) {
      _controller.value = 0;
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 64,
        right: 64,
      ),
      child: Transform.rotate(
        angle: rotation,
        child: Material(
          elevation: 3,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(500),
          clipBehavior: Clip.antiAlias,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/playing.png'),
                  )
              ),
              padding: const EdgeInsets.all(30),
              child: ClipOval(
                child: Image(
                  image: CachedImage(widget.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _PlayingCover extends StatefulWidget {
  final String img;
  const _PlayingCover({super.key, required this.img});
  @override
  State<StatefulWidget> createState() => _PlayingCoverState();
}
class _PlayingCoverState extends State<_PlayingCover> with SingleTickerProviderStateMixin {
  /// 针的动画控制
  late AnimationController _needleController;
  /// 指针动画控制
  bool needleCover = false;
  /// 指针动画
  late Animation<double> _needleAnimation;
  @override
  void initState() {
    super.initState();
    _needleController = AnimationController(
      vsync: this,
    );
    _needleAnimation = Tween<double>(begin: -1 / 12, end : 0).chain(CurveTween(curve: Curves.easeInOut)).animate(_needleController);
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ClipRect(
          child: Padding(
            padding:  const EdgeInsets.only(bottom: 20),
            child: Stack(
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 80,
                    ),
                    color: Colors.transparent,
                    child: _CenterContent(
                      img: widget.img,
                      rotating: false,
                    ),
                  ),
                ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Transform.translate(
                      offset: const Offset(40, -45),
                      child: RotationTransition(
                        turns: _needleAnimation,
                        child: Image.asset(
                            'lib/assets/images/playing_page_needle.png',
                          height: 180,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
class ProgressTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}
class PlayingPageState extends State<PlayingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.music.name,
              style: const TextStyle(
                fontSize: 14
              ),
            ),
            Text(
              widget.music.authorName,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _PlayBackground(img: widget.music.picUrl),
          _PlayingCover(
              img: widget.music.picUrl
          ),
        ],
      ),
    );
  }

}