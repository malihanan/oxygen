import 'package:flutter/material.dart';
import 'package:pocket_plant/global.dart';
import 'package:pocket_plant/styles.dart';
import 'package:pocket_plant/widgets/profile.dart';
import 'package:pocket_plant/widgets/tank.dart';
import 'package:pocket_plant/pages/refill_page.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyProfile(),
            Column(
              children: [
                Tank(
                  percentage: Oxygen.percentage,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Text(
                        "Purity: " + Oxygen.qualities[Oxygen.qualtiy],
                        style: CustomStyles.magentaText,
                      ),
                      Text(
                        "Flavor: " + Oxygen.flavours[Oxygen.flavour],
                        style: CustomStyles.magentaText,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    refillButton(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
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
      onTap: () {},
    );
  }
}
