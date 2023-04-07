import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import './components/bottomNavigator.dart';
import './components/searchAppBar.dart';
import 'pages/mobile/homePage.dart';
import './providers/homeHeadProvider.dart';
import 'pages/mobile/profilePage.dart';



void main() {
  // debugPaintSizeEnabled 设置为true可以开启绘制边界线
  // debugPaintSizeEnabled = true;
  // WidgetsFlutterBinding 绑定widget和flutter引擎的桥梁
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeHeadProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectIndex = 0;
  final List<Widget> widgets = [
    HomePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigator(
          tapFunction: (index) {
            setState(() {
              _selectIndex = index;
            });
          }
      ),
      body: widgets[_selectIndex],
    );
  }
}
