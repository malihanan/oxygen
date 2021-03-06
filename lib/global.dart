import 'package:flutter/material.dart';
import 'colors.dart';

class Profile {
  static String id = "IM4e692hgfb454Fhj38";
  static String name = "Ashley Thorne";
  static int age = 24;
  static String address = "248 Seg Street, New York";
  static String image = 'images/profile2.jpg';
  static int coins = 200;

  static List<StoreTank> tanks = [
    StoreTank(
      flavour: 2,
      qualtiy: 2,
      percentage: 40,
    ),
    StoreTank(
      flavour: 3,
      qualtiy: 1,
      percentage: 80,
    ),
    StoreTank(
      flavour: 1,
      qualtiy: 2,
      percentage: 20,
    ),
  ];
}

class StoreTank {
  final int percentage;
  final int qualtiy;
  final int flavour;

  StoreTank({
    @required this.percentage,
    @required this.qualtiy,
    @required this.flavour,
  });
}

class Oxygen {
  static List<String> qualities = ["Low", "Medium", "High"];
  static List<String> flavours = [
    "No Flavour",
    "Mint",
    "Chocolate",
    "Strawberry",
  ];

  static List<List<Color>> fluidColor = [
    [
      CustomColors.cyan,
      CustomColors.cyanShade,
    ],
    [
      CustomColors.green,
      CustomColors.greenShade,
    ],
    [
      CustomColors.yellow,
      CustomColors.yellowShade,
    ],
    [
      CustomColors.magenta,
      CustomColors.magentaShade,
    ],
  ];

  static int percentage = 70;
  static int qualtiy = 2;
  static int flavour = 0;
}
