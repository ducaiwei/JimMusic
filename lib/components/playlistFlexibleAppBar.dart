import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jimmusic/styles/theme.dart';
import '../model/songListDetail.dart';
import 'cachedImage.dart';


class _BackgroundClipper extends CustomClipper<Path>{
  final double height;
  final double bottom;
  _BackgroundClipper({
    required this.height,
    required this.bottom
  });

  @override
  getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0); // 起点位置
    path.lineTo(0, size.height - bottom - height); // 从起点开始绘制直线
    path.quadraticBezierTo(size.width / 2, size.height - bottom, size.width, size.height - bottom - height); // 绘制二阶贝塞尔曲线
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_BackgroundClipper oldClipper) {
    return bottom != oldClipper.bottom || height != oldClipper.height;
  }

}
class _BackgroundImage extends StatelessWidget {
  final ImageProvider imageProvider;
  final double current;
  const _BackgroundImage({
    required this.imageProvider,
    required this.current,
  });
  @override
  Widget build(BuildContext context) {
    final t = current > 66 ? 1.0 : current / 66;
    return ClipPath(
      clipper: _BackgroundClipper(
        // bottom: t * 20,
        // height: t * 14,
        bottom: 0,
        height: 0,
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Image(image: imageProvider, fit: BoxFit.cover, width: 120, height: 1,),
          RepaintBoundary(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
              child: ColoredBox(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          ColoredBox(color: Colors.black.withOpacity(0.3))
        ],
      ),
    );
  }
}
class _PlayListHeaderContent extends StatelessWidget {
  SongListDetail? detail;
  _PlayListHeaderContent({
    this.detail
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        SizedBox(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: CachedImage(detail!.coverImgUrl),
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail!.name,
                      style: context.primaryTextTheme.titleMedium,
                      maxLines: 2,
                    ),
                    const Spacer(),
                    Text(
                      detail!.description,
                      style: context.primaryTextTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class _AppBar extends StatelessWidget {
  final double t;
  SongListDetail? detail;
  _AppBar({
    required this.t,
    this.detail,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back_ios),
      //   onPressed: () {  },
      // ),  // leading是标题栏最前面的小部件  首页通常为logo 其他页面通常为返回按钮
      automaticallyImplyLeading: true,
      title: Text(t > 0.5 ? detail!.name : '歌单'),
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.onPrimary, // 标题栏中文字和icon默认的颜色
      elevation: 0,
      centerTitle: false, // 标题是否居中
      titleSpacing: 0,
    );
  }
  
}
class _OverlappedButton extends StatelessWidget {
  final Widget icon;
  final Widget label;
  final VoidCallback onPressed;
  const _OverlappedButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 100,
        height: 42,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTheme.merge(
                data: IconThemeData(
                  size: 18,
                  color: context.textTheme.bodySmall!.color,
                ),
                child: icon,
              ),
              const SizedBox(width: 8,),
              DefaultTextStyle(style: context.textTheme.bodySmall!, child: label),
            ],
          ),
        ),
      ),
    );
  }

}
class PlaylistFlexibleAppBar extends StatelessWidget {
  final SongListDetail detail;
  PlaylistFlexibleAppBar({
    super.key,
    required this.detail
  });
  @override
  Widget build(BuildContext context) {
    final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final deltaExtent = settings.maxExtent - settings.minExtent;
    final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0);
    final children = <Widget>[];
    var bottomPadding = 0.0;
    final sliverBar = context.findAncestorWidgetOfExactType<SliverAppBar>();
    if (sliverBar != null && sliverBar.bottom != null) {
      bottomPadding = sliverBar.bottom!.preferredSize.height;
    }
    /// 歌单背景
    children.add(
      Positioned(
        top: -Tween<double>(begin: 0, end: deltaExtent / 4.0).transform(t),
        left: 0,
        right: 0,
        bottom: 0,
        child: _BackgroundImage(
          imageProvider: CachedImage(detail!.coverImgUrl),
          current: settings.currentExtent - settings.minExtent,
        ),
      )
    );
    /// 歌单信息模块
    children.add(
      Positioned(
        top: settings.currentExtent - settings.maxExtent,
        left: 0,
        right: 0,
        height: settings.maxExtent,
        child: Opacity(
          opacity: 1 - t,
          child: Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: SafeArea(child: _PlayListHeaderContent(detail:  detail,),),
          )
        ),
      ),
    );
    /// 歌单名称导航
    children.add(
      Column(
        children: [
          _AppBar(
            t: t,
            detail: detail,
          )
        ],
      )
    );
    /// 收藏、评论按钮
    children.add(
      Positioned(
        left: 0,
        top: 0,
        right: 0,
        bottom: 25,
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _OverlappedButton(
                  icon: const Icon(Icons.library_add),
                  label: Text(detail.subscribedCount.toString()),
                  onPressed: (){
                  },
                ),
                const SizedBox(width: 16,),
                _OverlappedButton(
                  icon: const Icon(Icons.library_add),
                  label: Text(detail.subscribedCount.toString()),
                  onPressed: (){
                  },
                ),
                const SizedBox(width: 16,),
                _OverlappedButton(
                  icon: const Icon(Icons.library_add),
                  label: Text(detail.subscribedCount.toString()),
                  onPressed: (){
                  },
                ),
              ],
            ),
          ],
        ),
      )
    );
    return ClipRect(
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Stack(
          fit: StackFit.expand,
          children: children,
        ),
      ),
    );
  }
  
}