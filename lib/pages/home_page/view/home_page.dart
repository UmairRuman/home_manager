import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/view/grocreis_page.dart';
import 'package:flutter_project_home_manager/pages/home_page/widgets/bottom_navigation_bar.dart';
import 'package:flutter_project_home_manager/pages/overview_page/view/overview_page.dart';
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
  //page controller
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      child: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.loose,
          children: [
            PageView(
              allowImplicitScrolling: false,
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: const [
                OverviewPage(),
                UtilityPage(),
                WeatherPage(),
                GroceryPage(),
                ProfilePage(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: HomePageBottomNavigationBar(
                pageController: _pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
