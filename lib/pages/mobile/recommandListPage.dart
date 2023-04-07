
import 'package:flutter/material.dart';
import '../../components/recommandList.dart';
import '../../styles/musicUI.dart';

/// 推荐歌单列表页面
class RecommandListPage extends StatefulWidget {
  const RecommandListPage({super.key});

  @override
  State<StatefulWidget> createState() => RecommandListPageState();
}
class RecommandListPageState extends State<RecommandListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('推荐歌单'),
        backgroundColor: MusicUI.blackColor,
      ),
      body: const RecommandList(),
    );
  }
}