import 'package:flutter/material.dart';
import 'package:pocket_plant/global.dart';
import 'package:pocket_plant/styles.dart';
import 'package:pocket_plant/widgets/profile.dart';
import 'package:pocket_plant/widgets/tank.dart';

import '../colors.dart';

class RefillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Tank(
                percentage: Oxygen.percentage,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => PurityDrawer());
                      },
                      child: Text(
                        "Purity: " + Oxygen.qualities[Oxygen.qualtiy],
                        style: CustomStyles.magentaText,
                      ),
                    ),
                    Text(
                      "Flavor: " + Oxygen.flavours[Oxygen.flavour],
                      style: CustomStyles.magentaText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PurityDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double wigth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
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
      )),
    );
  }
}
