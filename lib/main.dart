import 'package:flutter/material.dart';
import 'package:pocket_plant/global.dart';
import 'package:pocket_plant/styles.dart';
import 'package:pocket_plant/widgets/profile.dart';
import 'package:pocket_plant/widgets/purityTab.dart';
import 'package:pocket_plant/widgets/tank.dart';
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
              percentage: Oxygen.percentage,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.08 + 16),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            refillButton(),
          ],
        ),
      ],
    );
  }

  Widget refillButton() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text(
              "REFILL",
              style: CustomStyles.refill,
            ),
            Container(
              width: 68,
              height: 1,
              color: CustomColors.green,
            ),
          ],
        ),
      ),
      onTap: () {
        print("Tapp");
        Oxygen.percentage = 40;
      },
    );
  }
}
