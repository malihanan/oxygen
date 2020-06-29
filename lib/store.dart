import 'package:flutter/material.dart';
import 'package:pocket_plant/widgets/linkButton.dart';

import 'colors.dart';
import 'global.dart';
import 'styles.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<Widget> items = [];
  List<double> itemMultiple = [];
  StoreTank selectedTank;

  Future<bool> _onWillPop() async {
    Navigator.of(context).popAndPushNamed('/');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < Profile.tanks.length; i++) {
      items.add(
        getListItem(Profile.tanks[i], context),
      );
      itemMultiple.add(1);
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView(
                      children: items,
                    ),
                  ),
                  selectedTank != null
                      ? Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Selected Tank',
                                  style: CustomStyles.magentaText),
                            ),
                            Container(
                              child: getListItem(selectedTank, context),
                            ),
                            LinkButton(
                              text: "Fill",
                              width: 48,
                              onTap: () {
                                Oxygen.flavour = selectedTank.flavour;
                                Oxygen.percentage = selectedTank.percentage;
                                Oxygen.qualtiy = selectedTank.qualtiy;
                                Navigator.of(context).popAndPushNamed('/');
                              },
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getListItem(StoreTank st, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTank = st;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
        ),
      ),
    );
  }
}
