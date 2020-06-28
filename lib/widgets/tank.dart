import 'package:flutter/material.dart';
import 'package:pocket_plant/colors.dart';
import 'package:pocket_plant/global.dart';
import 'package:pocket_plant/styles.dart';

class Tank extends StatefulWidget {
  final int percentage;

  Tank({@required this.percentage});

  @override
  _TankState createState() => _TankState();
}

class _TankState extends State<Tank> {
  double height;

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height * 0.35;
    height = totalHeight * widget.percentage.toDouble() / 100;
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
                  height: totalHeight - height - 8,
                ),
                Container(
                  height: height - 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: Oxygen.fluidColor[Oxygen.flavour],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      Oxygen.percentage.toString() + "%",
                      style: CustomStyles.whiteStyle,
                    ),
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
