import 'package:flutter/material.dart';
import 'package:jimmusic/styles/musicUI.dart';

/**
 * 圆角按钮组件
 */
class CircleButton extends StatefulWidget {
  String type;
  String text;
  CircleButton({required this.type, required this.text}): super();
  @override
  State<StatefulWidget> createState() {
    return  CircleButtonState(type: this.type, text: this.text);
  }

}
class CircleButtonState extends State<CircleButton> {
  String type;
  late IconData icon;
  String text;
  CircleButtonState({required this.type, required this.text});
  @override
  void initState() {
    switch(this.type) {
      case 'share':
        icon = Icons.share;
        break;
      case 'comment':
        icon = Icons.comment;
        break;
      case 'favorite':
        icon = Icons.favorite;
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: MusicUI.colorRgbaWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
  
}