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
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
            Tank(
              isStateful: false,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.09 + 16),
          ],
        ),
        Text(
          'Empties in 2 hours',
          style: CustomStyles.smallTextBlue,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LinkButton(
                text: "REFILL",
                width: 68,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return StorePage();
                      },
                    ),
                  );
                }),
            LinkButton(
              text: "BUY",
              width: 38,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BuyPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
