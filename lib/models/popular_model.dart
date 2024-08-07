class PopularDiet {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDiet({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected
  });
  
  static List<PopularDiet> getPopularDiets() {
    List<PopularDiet> popularDiets = [];

    popularDiets.add(PopularDiet(
        name: 'Blueberry Pancake',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: '30min',
        calorie: '230kCal',
        boxIsSelected: true
    ));

    popularDiets.add(PopularDiet(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Easy',
        duration: '20min',
        calorie: '120kCal',
        boxIsSelected: false
    ));

    return popularDiets;
  }
}