import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

part 'Status.g.dart';

@JsonSerializable(nullable: false)
class Person {
  String name;
  int age;
  int credits;
  List<Tank> tankChain;

  Person(name, age) {
    this.name = name;
    this.age = age;
    this.credits = 10000; //starting credits
    this.tankChain = new List<Tank>();
    this.tankChain.add(new Tank(5, Flavor.Regular, 2)); // first tank as a gift
  }

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  addTank(Tank t) {
    this.credits -= t.price;
    this.tankChain.add(t);
  }

  addCredits(int points) {
    if (points >= 0) {
      this.credits += points;
    }
  }
}

@JsonSerializable(nullable: false)
class Tank {
  int timeout;
  Flavor flavor;
  int richness; //grade = 1, 2 or 3. 3 is richest
  int price; //in pts

  Tank(this.timeout, this.flavor, this.richness) {
    this.price = this.timeout * richness;
  }

  factory Tank.fromJson(Map<String, dynamic> json) => _$TankFromJson(json);
  Map<String, dynamic> toJson() => _$TankToJson(this);
}

enum Flavor { Regular, Chocolate, Mint, Strawberry, Apple }

//globals

Person p;
String key = "alpha";

//Testing objects

updateCurrentTank() {
  if (p.tankChain.isEmpty) {
    print("Caution: You'll die");
    return;
  }
  print(p.tankChain[0].flavor.toString() +
      " " +
      p.tankChain[0].timeout.toString());
  p.tankChain[0].timeout -= 1;
  if (p.tankChain[0].timeout == 0) {
    p.tankChain.remove(p.tankChain[0]);
  }

  String x = jsonEncode(p);
  Person p2 = Person.fromJson(jsonDecode(x));
  print(x);
  print(p2.name + " " + p2.tankChain[0].flavor.toString());
}

void myFunc() async {
  String x = jsonEncode(p);
  Person p2 = Person.fromJson(jsonDecode(x));
  print(x);
  print(p2.name + p2.tankChain[0].flavor.toString());
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, x);
}

Future<String> getget() async {
  final prefs = await SharedPreferences.getInstance();
  Person p3 = Person.fromJson(jsonDecode(prefs.getString(key)));
  print(p3.credits);
}

Future<String> getDetails() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

//Testing ends

void updateObject() async {
  final prefs = await SharedPreferences.getInstance();
  String x = jsonEncode(p);
  prefs.setString(key, x);
}

void fetchObject() async {
  final prefs = await SharedPreferences.getInstance();
  String json = prefs.getString(key);
  p = Person.fromJson(jsonDecode(json));
}

void queueAndDecrement() {
  if (p.tankChain.isEmpty) {
    // print("Caution: You'll die");
    return;
  }
  p.tankChain[0].timeout -= 1;
  // print(p.tankChain[0].flavor.toString() + " " + p.tankChain[0].timeout.toString());
  if (p.tankChain[0].timeout == 0) {
    p.tankChain.removeAt(0);
  }
}

void secondlyJob() {
  updateObject();
  queueAndDecrement();
}
