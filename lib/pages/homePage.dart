import 'package:flutter/material.dart';
import '../components/homeListView.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  HomePageState() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeListView(),
    );
  }
}