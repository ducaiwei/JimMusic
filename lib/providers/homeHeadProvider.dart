import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/homeHeadModel.dart';

class HomeHeadProvider extends ChangeNotifier with DiagnosticableTreeMixin {
  final List<HomeHeadModel> list = [
    HomeHeadModel('每日推荐', Icons.calendar_today),
    HomeHeadModel('排行榜', Icons.leaderboard),
    HomeHeadModel('FM', Icons.radio)
  ];

}