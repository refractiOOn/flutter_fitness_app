import 'package:flutter/material.dart';

class Diet {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  Diet({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List<Diet> getDiets() {
    List<Diet> diets = [];

    diets.add(Diet(
          name: 'Honey Pancake',
          iconPath: 'assets/icons/honey-pancakes.svg',
          level: 'Easy',
          duration: '30min',
          calorie: '180kCal',
          boxColor: const Color(0xFF9DCEFF),
          viewIsSelected: true
    ));

    diets.add(Diet(
            name: 'Canai Bread',
            iconPath: 'assets/icons/canai-bread.svg',
            level: 'Easy',
            duration: '20min',
            calorie: '230kCal',
            boxColor: const Color(0xFFEEA4CE),
            viewIsSelected: false
    ));

    return diets;
  }
}