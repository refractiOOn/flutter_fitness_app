import 'package:flutter/material.dart';

class Category {
  String name;
  String iconPath;
  Color boxColor;

  Category({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<Category> getCategories() {
    List<Category> categories = [];

    categories.add(Category(
        name: 'Salad',
        iconPath: 'assets/icons/plate.svg',
        boxColor: const Color(0xFF92A3FD)
    ));

    categories.add(Category(
        name: 'Cake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: const Color(0xFFC58BF2)
    ));

    categories.add(Category(
        name: 'Pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: const Color(0xFF92A3FD)
    ));

    categories.add(Category(
        name: 'Smoothies',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: const Color(0xFFC58BF2)
    ));

    return categories;
  }
}