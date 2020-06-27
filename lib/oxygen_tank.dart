import 'dart:math' as math;

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  double percentage;
  CountDownTimer({
    this.percentage,
  });
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    double p = (1 - controller.value) * widget.percentage;
    return p.toStringAsFixed(1) + '%';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 305,
                    width: 200,
                    child: Tank(themeData: themeData, controller: controller)),
                Container(
                  height: 200,
                  width: 200,
                  child: PercentageBox(
                      controller: controller,
                      themeData: themeData,
                      widget: widget,
                      timerString: timerString),
                ),
              ],
            ),
          );
        });
  }
}

class Tank extends StatelessWidget {
  const Tank({
    Key key,
    @required this.themeData,
    @required this.controller,
  }) : super(key: key);

  final ThemeData themeData;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(children: <Widget>[
        Positioned(
          bottom: 10.0,
          left: 24,
          child: Container(
            width: 80,
            color: themeData.indicatorColor,
            height: (1 - controller.value) * 180,
          ),
        ),
        Container(
          height: 305,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/oxygen-tank.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ]),
    );
  }
}

class PercentageBox extends StatelessWidget {
  const PercentageBox({
    Key key,
    @required this.controller,
    @required this.themeData,
    @required this.widget,
    @required this.timerString,
  }) : super(key: key);

  final AnimationController controller;
  final ThemeData themeData;
  final CountDownTimer widget;
  final String timerString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: FractionalOffset.center,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: CustomPaint(
                          painter: CustomTimerPainter(
                              animation: controller,
                              backgroundColor: Colors.white,
                              color: themeData.indicatorColor,
                              percentage: widget.percentage)),
                    ),
                    Align(
                      alignment: FractionalOffset.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            timerString,
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter(
      {this.animation, this.backgroundColor, this.color, this.percentage})
      : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;
  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress =
        ((1.0 - animation.value)) * 2 * math.pi * (percentage / 100);
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
