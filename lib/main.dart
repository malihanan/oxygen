import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pocket_plant/styles.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: CustomColors.darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyProfile(),
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          CustomPaint(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('images/rings.png'),
                    height: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 32,
                    ),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/profile.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Ashley Thorne',
                style: CustomStyles.smallText,
              ),
              Text(
                'IM4e692hgfb454Fhj38',
                style: CustomStyles.smallTextBlue,
              ),
              Text(
                '248 Sesame Street, New York',
                style: CustomStyles.smallText,
              ),
              Text(
                'Plant 35474',
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
        height: 12,
        width: 12,
        color: colors[i],
      ));
    }
    return Row(
      children: boxes,
    );
  }
}
