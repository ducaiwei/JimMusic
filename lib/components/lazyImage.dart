
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


/// 远程图片渲染
class LazyImage extends StatelessWidget {
  final String imgUrl;
  const LazyImage({
    Key? key,
    required this.imgUrl,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  !identical(imgUrl, '') ? FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: imgUrl,
    ) : Text('');
  }
}