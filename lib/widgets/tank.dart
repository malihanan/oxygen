import 'package:flutter/material.dart';
import 'package:pocket_plant/colors.dart';
import 'package:pocket_plant/global.dart';
import 'package:pocket_plant/styles.dart';

class Tank extends StatefulWidget {
  final bool isStateful;

  Tank({@required this.isStateful});

  @override
  _TankState createState() => _TankState();

  int getPercentage() {
    return _TankState.percentage;
  }
}

class _TankState extends State<Tank> {
  double height;
  static int percentage = Oxygen.percentage;

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height * 0.35;
    height = totalHeight * percentage.toDouble() / 100;
    double totalWidth = MediaQuery.of(context).size.width * 0.24;

    double _initial = 0.0;
    double _drag = 0.0;

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
        GestureDetector(
          child: Container(
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
                        colors: Oxygen.fluidColor[Oxygen.flavour],
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
          onPanStart: (DragStartDetails details) {
            _initial = details.globalPosition.dy;
          },
          onPanUpdate: (DragUpdateDetails details) {
            _drag = details.globalPosition.dy - _initial;
          },
          onPanEnd: (DragEndDetails details) {
            if (widget.isStateful) {
              //dragged down
              if (_drag > 0) {
                setState(() {
                  if (percentage > 20) {
                    percentage -= 10;
                  }
                });
              } else if (_drag < 0) {
                setState(() {
                  if (percentage < 100) {
                    percentage += 10;
                  }
                });
              }
            }
          },
        ),
      ],
    );
  }
}
