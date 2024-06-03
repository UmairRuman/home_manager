import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/view/grocreis_page.dart';
import 'package:flutter_project_home_manager/pages/home_page/widgets/bottom_navigation_bar.dart';
import 'package:flutter_project_home_manager/pages/overview_page/view/overview_page.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/bills_expenses_text.dart';
import 'package:flutter_project_home_manager/pages/profile_page/view/profile_page.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/view/utilities_page.dart';
import 'package:flutter_project_home_manager/pages/weather_page/view/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const pageAddress = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  //pages
  static const _firstPageIndex = 0;
  static const _secondPageIndex = 1;
  static const _thirdPageIndex = 2;
  static const _fourthPageIndex = 3;
  static const _fifthPageIndex = 4;

  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          if (currentIndex == _firstPageIndex) {
            return const OverviewPage();
          } else if (currentIndex == _secondPageIndex) {
            return const GroceryPage();
          } else if (currentIndex == _thirdPageIndex) {
            return const WeatherPage();
          } else if (currentIndex == _fourthPageIndex) {
            return const UtilityPage();
          } else {
            return const ProfilePage();
          }
        },
      ),
      bottomNavigationBar: HomePageBottomNavigationBar(
        changeState: changeState,
        currentIndex: currentIndex,
      ),
    );
  }
}
