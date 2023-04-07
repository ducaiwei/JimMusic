import 'package:flutter/material.dart';
import 'package:jimmusic/styles/musicUI.dart';
import 'loginPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfilePageState();

}
class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '还未登陆，请先登陆',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_){
                    return LoginPage();
                  },
                )
              );
            },
            child: Text(
              '点击登陆',
              style: TextStyle(
                color: MusicUI.colorDeepRed,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}