import 'package:flutter/material.dart';
import 'package:pocket_plant/colors.dart';
import 'package:pocket_plant/global.dart';

class PurityTab extends StatefulWidget {
  final bool isStateful;

  PurityTab({
    @required this.isStateful,
  });

  @override
  _PurityTabState createState() => _PurityTabState();
}

class _PurityTabState extends State<PurityTab> {
  @override
  Widget build(BuildContext context) {
    List<Widget> containers = [];
    for (int i = 2; i >= 0; i--) {
      containers.add(Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.06,
        decoration: BoxDecoration(
          color: Oxygen.qualtiy == i ? CustomColors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            Oxygen.qualities[i][0],
            style: TextStyle(
              fontFamily: 'Raleway',
            ),
          ),
        ),
      ));
    }

    double _initial = 0.0;
    double _drag = 0.0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColors.green,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: containers,
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
                Oxygen.qualtiy = (Oxygen.qualtiy - 1) % 3;
              });
            } else if (_drag < 0) {
              setState(() {
                Oxygen.qualtiy = (Oxygen.qualtiy + 1) % 3;
              });
            }
          }
        },
      ),
    );
  }
}
