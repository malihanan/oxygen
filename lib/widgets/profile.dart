import 'package:flutter/material.dart';
import 'package:pocket_plant/colors.dart';

import '../global.dart';
import '../styles.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Padding(
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
                  child: ShaderMask(
                    child: Image(
                      height: MediaQuery.of(context).size.height * 0.1,
                      image: AssetImage(
                        Profile.image,
                      ),
                    ),
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          CustomColors.magenta,
                          CustomColors.magentaShade,
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.modulate,
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
              SizedBox(height: 2),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.monetization_on,
                    size: 20,
                    color: Color.fromRGBO(249, 166, 2, 1),
                  ),
                  Text(
                    " " + Profile.coins.toString(),
                    style: CustomStyles.smallText,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: getColorLine(),
              ),
              Text(
                Oxygen.qualities[Oxygen.qualtiy] +
                    " Quality, " +
                    Oxygen.flavours[Oxygen.flavour],
                style: CustomStyles.smallText,
              ),
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    Profile.coins += 100;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: CustomColors.magenta,
                      size: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Add Coins',
                          style: TextStyle(
                              color: CustomColors.magenta,
                              fontFamily: 'Raleway'),
                        ),
                        Container(
                          color: CustomColors.green,
                          height: 1,
                          width: 70,
                        )
                      ],
                    ),
                  ],
                ),
              ),
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
