import 'package:flutter/material.dart';
import '../../styles/musicUI.dart';
import 'loginPasswordPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('手机号登陆'),
        backgroundColor: Colors.black,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              autofocus: true,
              cursorColor: Color(0xffea3838),
              style: const TextStyle(
                color: Colors.white
              ),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: '请输入手机号',
                hintText: '手机号',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffea3838),
                  )
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return LoginPasswordPage(phone: _textController.text);
                    }
                  )
                );
              },
              color: MusicUI.colorDeepRed,
              minWidth: double.infinity,
              height: 40,
              child: const Text(
                '下一步',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}