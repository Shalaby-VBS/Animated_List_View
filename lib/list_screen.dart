import 'dart:math';

import 'package:flutter/material.dart';

import 'animated_list_view.dart';
import 'object_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;

  List<ObjectModel> objects = [
    ObjectModel(
      title: "Egypt",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Palestine",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "KSA",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Qatar",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "UAE",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Yemen",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Syria",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Libya",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Morocco",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Iraq",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Jordan",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Oman",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Turki",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Iran",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Pakistan",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "China",
      icon: Icons.monetization_on,
    ),
    ObjectModel(
      title: "Russia",
      icon: Icons.monetization_on,
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      debugPrint("Animation of list is started!");
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF222431),
      body: SafeArea(
        child: AnimatedListView(
          list: objects,
          singleItem: singleItem,
        ),
      ),
    );
  }

  Widget singleItem(int index) {
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
      decoration: BoxDecoration(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index + 1}. ${objects[index].title}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(objects[index].icon),
        ],
      ),
    );
  }
}
