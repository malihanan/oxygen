import 'package:flutter/material.dart';
import 'package:pocket_plant/global.dart';
import 'package:pocket_plant/styles.dart';
import 'package:pocket_plant/widgets/linkButton.dart';
import 'package:pocket_plant/widgets/profile.dart';
import 'package:pocket_plant/widgets/purityTab.dart';
import 'package:pocket_plant/widgets/tank.dart';
import 'buy.dart';
import 'colors.dart';
import 'store.dart';
import 'dart:async';

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
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/buy': (context) => Buy(),
        '/store': (context) => Store(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Tank tank;
  int p = Oxygen.percentage;
  @override
  void initState() {
    super.initState();
    tank = Tank(
      flavor: Oxygen.flavour,
      percentage: p - 1,
    );

    Timer t = new Timer.periodic(
        Duration(seconds: 1), (Timer t) => decreasePercentage());
  }

  decreasePercentage() {
    setState(() {
      if (p > 10) {
        tank = Tank(
          flavor: Oxygen.flavour,
          percentage: p - 1,
        );
        p--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyProfile(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PurityTab(
                  isStateful: false,
                ),
                tank,
                SizedBox(width: MediaQuery.of(context).size.width * 0.09 + 16),
              ],
            ),
            Text(
              'Empties in ' + (Oxygen.percentage * 5).toString() + ' seconds',
              style: CustomStyles.smallTextBlue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinkButton(
                    text: "REFILL",
                    width: 68,
                    onTap: () {
                      Navigator.of(context).popAndPushNamed(
                        '/store',
                      );
                    }),
                LinkButton(
                  text: "BUY",
                  width: 38,
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(
                      '/buy',
                    );
                  },
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
