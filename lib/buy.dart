import 'package:flutter/material.dart';
import 'package:pocket_plant/styles.dart';
import 'package:pocket_plant/widgets/flavorTab.dart';
import 'package:pocket_plant/widgets/linkButton.dart';

import 'colors.dart';
import 'global.dart';
import 'widgets/purityTab.dart';
import 'widgets/tank.dart';

class BuyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: CustomColors.darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Buy(),
      ),
    );
  }
}

class Buy extends StatefulWidget {
  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  int quality = Oxygen.qualtiy;
  PurityTab purityTab = PurityTab(
    isStateful: true,
  );
  Tank tank = Tank(
    isStateful: true,
  );
  FlavorTab flavorTab = FlavorTab(
    isStateful: true,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Buy Tank",
                  style: CustomStyles.magentaText,
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.magentaShade,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              purityTab,
              tank,
              flavorTab,
            ],
          ),
          GestureDetector(
            child: LinkButton(
              text: "ADD TO STORE",
              width: 142,
              onTap: () {
                Oxygen.flavour = flavorTab.getFlavor();
                Oxygen.qualtiy = purityTab.getPurity();
                Oxygen.percentage = tank.getPercentage();
              },
            ),
          ),
        ],
      ),
    );
  }
}
