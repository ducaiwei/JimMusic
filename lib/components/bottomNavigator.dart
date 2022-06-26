import 'package:flutter/material.dart';
import 'dart:math';


/**
 * 底部导航菜单
 */
class BottomNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigatorState();
  
}
class BottomNavigatorState extends State<BottomNavigator> {
  late final double _maxSizeBottomNavigationBar = MediaQuery.of(context).padding.bottom + kBottomNavigationBarHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: max(0, _maxSizeBottomNavigationBar),
      child:  SingleChildScrollView(
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: Colors.grey[900],
          unselectedItemColor: Colors.grey[600],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '发现',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: '我的',
            ),
          ],
        ),
      ),
    );
  }

}