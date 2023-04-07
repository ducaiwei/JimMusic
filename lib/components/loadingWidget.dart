import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef ContentWidgetBuilder<T> = Widget Function(BuildContext context, T data);

class LoadingWidget<T> extends StatefulWidget {
  final Future<dynamic> Function() loadFn;
  final ContentWidgetBuilder builder;
  final double height;
  LoadingWidget({Key? key, required this.loadFn, required this.builder, required this.height});
  @override
  State<StatefulWidget> createState() => LoadingWidgetState<T>();

}
class LoadingWidgetState<T> extends State {
  var isLoading = true;
  late T data;
  @override
  LoadingWidget<T> get widget => super.widget as LoadingWidget<T>;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      this.initData();
    });
  }
  void initData() async {
    isLoading = true;
    data  = await widget.loadFn() as T;
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ? Container(
        width: MediaQuery.of(context).size.width,
        height: widget.height,
        child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffea3838)),
            ))),
    ): widget.builder(context, data);
  }
  
}