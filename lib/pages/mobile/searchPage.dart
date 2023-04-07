import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => SearchPageState();
}
class SearchPageState extends State<SearchPage> {
  _handleSearch() {
  }
  _handleClear() {
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _handleSearch,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: _handleClear,
                  ),
                  hintText: 'search.....',
                  border: InputBorder.none,
                ),
              ),
            ),
          )
      ),
      backgroundColor: Colors.black,
      body: Container(
      ),
    );
  }

}