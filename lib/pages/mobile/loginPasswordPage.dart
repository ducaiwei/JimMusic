import 'package:flutter/material.dart';
import '../../styles/musicUI.dart';
import '../../api/request.dart';
import '../../utils/snackBarExtension.dart';
import 'package:async/async.dart' show Result;


class LoginPasswordPage extends StatefulWidget {
  final String phone;

  const LoginPasswordPage({super.key, required this.phone});
  @override
  State<StatefulWidget> createState() => LoginPasswordPageState();

}
class LoginPasswordPageState extends State<LoginPasswordPage> {
  TextEditingController _textEditingController = TextEditingController();
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
          children: [
            TextField(
              controller: _textEditingController,
              autofocus: true,
              cursorColor: const Color(0xffea3838),
              style: const TextStyle(
                  color: Colors.white
              ),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '请输入密码',
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffea3838),
                  )
                )
              ),
            ),
            MaterialButton(
              color: MusicUI.colorDeepRed,
              minWidth: double.infinity,
              height: 40,
              onPressed: () async {
                  final Result<Map> result = await MusicRequest.loginByPhone(widget.phone, _textEditingController.text) as Result<Map>;
                  if (result.isValue) { // 成功

                  } else { // 失败
                    context.showSnack('登陆失败: ${result.asError!.error}');
                  }
              },
              child: const Text(
                '立即登陆',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}