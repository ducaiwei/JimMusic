import 'package:flutter/material.dart';
import './components/bottomNavigator.dart';
import './pages/searchPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ok music player',
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
  void _incrementCounter() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('音乐'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage()));
          }, icon: Icon(Icons.search)),
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: new BottomNavigator(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
