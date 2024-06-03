import 'package:flutter/material.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  const HomePageBottomNavigationBar({super.key, required this.pageController});

  final PageController pageController;

  //pages
  static const _firstPageIndex = 0;
  static const _secondPageIndex = 1;
  static const _thirdPageIndex = 2;
  static const _fourthPageIndex = 3;
  static const _fifthPageIndex = 4;

  // icon labels

  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    int currentIndex = 0;

    void _onBottomIconTap(int index) {
      //switch to current page based on index
      switch (index) {
        case 0:
          pageController.jumpToPage(
            _firstPageIndex,
          );
          break;
        case 1:
          pageController.jumpToPage(_secondPageIndex);
          break;
        case 2:
          pageController.jumpToPage(_thirdPageIndex);
          break;
        case 3:
          pageController.jumpToPage(_fourthPageIndex);
          break;
        default:
          pageController.jumpToPage(_fifthPageIndex);
      }
      //assign current index variable the index coming from parameter
      currentIndex = index;
    }

    final selectedTextStyle = TextStyle(
        color: Colors.black,
        fontSize: height * 0.015,
        fontWeight: FontWeight.bold);

    return StatefulBuilder(
      builder: (context, setState) {
        return BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'First'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Second'),
        ]);

        /// items need to be added
      },
    );
  }
}
