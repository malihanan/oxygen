import 'package:flutter/material.dart';

import '../colors.dart';
import '../global.dart';
import '../styles.dart';

class Tank extends StatelessWidget {
  final int percentage;
  final int flavor;

  Tank({@required this.percentage, @required this.flavor});

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height * 0.35;
    double height = totalHeight * percentage.toDouble() / 100;
    double totalWidth = MediaQuery.of(context).size.width * 0.24;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColors.magenta,
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Container(
          height: totalHeight,
          width: totalWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: CustomColors.magenta,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                Container(
                  height: totalHeight - height,
                ),
                Container(
                  height: height - 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: Oxygen.fluidColor[flavor],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Center(
                    child: percentage != 0
                        ? Text(
                            percentage.toString() + "%",
                            style: CustomStyles.whiteStyle,
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
