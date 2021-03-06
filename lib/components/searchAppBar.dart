import 'package:flutter/material.dart';
import '../pages/searchPage.dart';

/**
 * AppBar抽出来  需要实现PreferredSizeWidget接口
 */
class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() => SearchAppBarState();

  @override
  Size get preferredSize => new Size(100, 40);

}
class SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.black,
        title: Text('吉姆音乐'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage()));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }

}