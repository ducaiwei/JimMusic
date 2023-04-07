import 'package:flutter/material.dart';

/// 每日推荐歌曲
class DayRecommendPage extends StatefulWidget {
  const DayRecommendPage({super.key});
  @override
  State<StatefulWidget> createState() => DayRecommendPageState();
}
class DayRecommendPageState extends State<DayRecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('每日推荐'),
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      body: Text('每日推荐'),
    );
  }

}