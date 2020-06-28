import 'package:flutter/material.dart';

import 'colors.dart';
import 'global.dart';
import 'styles.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: CustomColors.darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Store(),
      ),
    );
  }
}

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<Widget> items = [];
  List<double> itemMultiple = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < Profile.tanks.length; i++) {
      items.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getListItem(Profile.tanks[i], context),
        ),
      );
      itemMultiple.add(1);
    }

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Store",
                  style: CustomStyles.magentaText,
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.magentaShade,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: ListView(
              // scrollDirection: Axis.horizontal,
              children: items,
            ),
          )
        ],
      ),
    );
  }

  Widget getListItem(StoreTank st, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Oxygen.fluidColor[st.flavour][0],
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: Oxygen.fluidColor[st.flavour],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Oxygen.flavours[st.flavour],
                      style: CustomStyles.whiteStyle,
                    ),
                    SizedBox(height: 4),
                    Text(
                      Oxygen.qualities[st.qualtiy] + " Quality",
                      style: CustomStyles.whiteStyle,
                    ),
                  ],
                ),
                Text(
                  st.percentage.toString() + "%",
                  style: CustomStyles.whiteStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
