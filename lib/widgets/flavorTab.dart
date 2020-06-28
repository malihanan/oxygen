import 'package:flutter/material.dart';
import 'package:pocket_plant/colors.dart';
import 'package:pocket_plant/global.dart';

class FlavorTab extends StatefulWidget {
  final bool isStateful;

  FlavorTab({
    @required this.isStateful,
  });

  @override
  _FlavorTabState createState() => _FlavorTabState();

  int getFlavor() {
    return _FlavorTabState.flavor;
  }
}

class _FlavorTabState extends State<FlavorTab> {
  static int flavor = Oxygen.flavour;

  @override
  Widget build(BuildContext context) {
    List<Widget> containers = [];
    for (int i = 0; i < Oxygen.flavours.length; i++) {
      containers.add(Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          color: flavor == i ? CustomColors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            Oxygen.flavours[i][0],
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
              width: 1,
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
                flavor = (flavor + 1) % Oxygen.flavours.length;
              });
            } else if (_drag < 0) {
              setState(() {
                flavor = (flavor - 1) % Oxygen.flavours.length;
              });
            }
          }
        },
      ),
    );
  }
}
