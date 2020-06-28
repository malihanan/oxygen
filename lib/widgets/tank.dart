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

class _TankState extends State<Tank> with TickerProviderStateMixin {
  AnimationController controller;
  double height;

  String get percentageString {
    double p = (1 - controller.value) * widget.percentage;
    return p.toStringAsFixed(0) + '%';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller.reverse(from: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    height = 2.5 * widget.percentage.toDouble();
    double totalHeight = MediaQuery.of(context).size.height * 0.35;

    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.magenta),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: totalHeight,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: CustomColors.magenta),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Container(
                      height: totalHeight - height + 23,
                    ),
                    Container(
                      height: (1 - controller.value) * height,
                      width: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            CustomColors.magenta,
                            CustomColors.magentaShade
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          percentageString,
                          style: CustomStyles.whiteStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
