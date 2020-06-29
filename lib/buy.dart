import 'package:flutter/material.dart';
import 'package:pocket_plant/styles.dart';
import 'package:pocket_plant/widgets/flavorTab.dart';
import 'package:pocket_plant/widgets/linkButton.dart';

import 'colors.dart';
import 'global.dart';
import 'widgets/purityTab.dart';
import 'widgets/tank.dart';

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
    flavor: Oxygen.flavour,
    percentage: Oxygen.percentage,
  );
  FlavorTab flavorTab = FlavorTab(
    isStateful: true,
  );

  Future<bool> _onWillPop() async {
    Navigator.of(context).popAndPushNamed('/');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Builder(builder: (context) {
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.31 -
                          MediaQuery.of(context).size.width * 0.06 -
                          96,
                    ),
                    tank,
                    getFlavorTab(),
                  ],
                ),
                GestureDetector(
                  child: LinkButton(
                    text: "ADD TO STORE",
                    width: 142,
                    onTap: () {
                      StoreTank st = StoreTank(
                        flavour: flavorTab.getFlavor(),
                        qualtiy: purityTab.getPurity(),
                        percentage: tank.getPercentage(),
                      );
                      Profile.tanks.add(st);
                      Navigator.of(context).popAndPushNamed('/store');
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget getFlavorTab() {
    List<Widget> containers = [];
    for (int i = 0; i < Oxygen.flavours.length; i++) {
      containers.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  tank = Tank(
                    flavor: i,
                    percentage: tank.getPercentage(),
                    isStateful: true,
                  );
                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.11,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColors.magenta,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: Oxygen.fluidColor[i]),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 20,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: CustomColors.magenta,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: CustomColors.magenta,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  Oxygen.flavours[i],
                  style: CustomStyles.smallText,
                ),
              ),
            ),
          ],
        ),
      ));
    }

    return Column(
      children: containers,
    );
  }
}
