import 'package:flutter/material.dart';

import '../colors.dart';
import '../styles.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final double width;
  final Function onTap;

  LinkButton({
    @required this.text,
    @required this.width,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32),
          child: Column(
            children: [
              Text(
                text,
                style: CustomStyles.refill,
              ),
              Container(
                width: width,
                height: 1,
                color: CustomColors.green,
              ),
            ],
          ),
        ),
      ),
      onPressed: onTap,
      highlightColor: Colors.transparent,
    );
  }
}
