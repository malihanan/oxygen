import 'package:flutter/material.dart';

import '../global.dart';
import '../styles.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          CustomPaint(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/rings.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      Profile.image,
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Profile.name + ", " + Profile.age.toString(),
                style: CustomStyles.smallText,
              ),
              Text(
                Profile.id,
                style: CustomStyles.smallTextBlue,
              ),
              Text(
                Profile.address,
                style: CustomStyles.smallText,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: getColorLine(),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getColorLine() {
    List<Color> colors = [
      Colors.red[700],
      Colors.red[400],
      Colors.amber[600],
      Colors.amber[400],
      Colors.green[900],
      Colors.green[700],
      Colors.green[400],
      Colors.green[300],
      Colors.green[200]
    ];
    List<Widget> boxes = [];
    for (int i = 0; i < colors.length; i++) {
      boxes.add(Container(
        height: 8,
        width: 8,
        color: colors[i],
      ));
    }
    return Row(
      children: boxes,
    );
  }
}
