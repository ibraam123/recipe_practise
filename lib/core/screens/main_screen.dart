import 'package:flutter/material.dart';

import '../../features/favorites/presentation/views/favorites_view.dart';
import '../../features/planner/presentation/views/planner_view.dart';
import '../../features/recipes/presentation/views/home_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String title = 'RecipeBox';

  List<Widget> screens = [
    const HomeView(),
    const FavoritesView(),
    const PlannerView(),
  ];

  int currentIndex = 0;

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: 'Planner',
    ),
  ];

  Widget navBar(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          switch (index) {
            case 0:
              title = 'RecipeBox';
              currentIndex = 0;
              break;
            case 1:
              title = 'Favorites';
              currentIndex = 1;
              break;
            case 2:
              title = 'Planner';
              currentIndex = 2;
              break;
          }
        });
      },
      items: navBarItems,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navBar(),
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
