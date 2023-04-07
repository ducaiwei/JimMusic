import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/homeHeadProvider.dart';
import '../model/homeHeadModel.dart';
import '../styles/musicUI.dart';

class HomeHeadCard extends StatelessWidget {
  final Function tapFunction;
  const HomeHeadCard({
    super.key,
    required this.tapFunction,
  });

  List<Widget> renderItem(List<HomeHeadModel> list) {
    final List<Widget> result = [];
    if (list.isNotEmpty) {
        list.forEach((item) {
        result.add(
          GestureDetector(
            onTap: () {
              tapFunction(item);
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MusicUI.colorShallowRed,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: Icon(
                    item.icon,
                    color: MusicUI.colorDeepRed,
                  ),
                ),
                Text(
                  item.title,
                  style: MusicUI.musicTextStyle,
                ),
              ],
            ),
          ),
        );
      });
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: renderItem(context.read<HomeHeadProvider>().list),
    );
  }

}