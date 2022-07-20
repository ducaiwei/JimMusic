import 'package:flutter/material.dart';


class InfiniteGridView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InfiniteGridViewState();

}

class InfiniteGridViewState extends State<InfiniteGridView> {
  ScrollController _controller = ScrollController();

  List<Widget> _listView() {

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          controller: _controller,
          children: _listView(),
        )
    );
  }
  
}