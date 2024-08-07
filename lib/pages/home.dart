import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void setupModels() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
    setupModels();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        searchField(),
        const SizedBox(height: 40.0),
        categorySection(),
        const SizedBox(height: 40.0),
        dietSection()
      ]),
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15.0),
            hintText: 'Search Pancake',
            hintStyle: const TextStyle(color: Color(0xFFDDDADA), fontSize: 14),
            prefixIcon: icon('assets/icons/Search.svg', 12.0),
            suffixIcon: searchFieldSuffix(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  SizedBox searchFieldSuffix() {
    return SizedBox(
      width: 100,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            searchFieldDivider(),
            icon('assets/icons/Filter.svg', 12.0),
          ],
        ),
      ),
    );
  }

  VerticalDivider searchFieldDivider() {
    return const VerticalDivider(
      indent: 10,
      endIndent: 10,
      color: Colors.black,
      thickness: 0.1,
    );
  }

  Column categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader('Category'),
        const SizedBox(height: 15.0),
        categoriesView()
      ],
    );
  }

  Column dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader('Recommendation\nfor Diet'),
        const SizedBox(height: 15.0),
        dietView()
      ],
    );
  }

  Padding sectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Container categoriesView() {
    return Container(
        height: 120,
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: icon(categories[index].iconPath, 8.0)),
                      Text(categories[index].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  ));
            }));
  }

  Container dietView() {
    return Container(
        height: 220,
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: diets.length,
            itemBuilder: (context, index) {
              return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Column(
                        children: [
                          Text(diets[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text(
                              '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                              style: const TextStyle(
                                  color: Color(0xFF7B6F72),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(colors: [
                              diets[index].viewIsSelected ? Color(0xFF9DCEFF) : Colors.transparent,
                              diets[index].viewIsSelected ? Color(0xFF92A3FD) : Colors.transparent
                            ])),
                        child: const Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        )
                      )
                    ],
                  ));
            }));
  }

  Padding icon(String path, double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(path),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
          onTap: () {},
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/icons/Arrow - Left 2.svg',
                width: 20,
                height: 20,
              ))),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 37,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                width: 5,
                height: 5,
              ),
            )),
      ],
    );
  }
}
