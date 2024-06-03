import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  HomePageBottomNavigationBar(
      {super.key, required this.currentIndex, required this.changeState});
  int currentIndex;
  VoidCallback changeState;
  final NotchBottomBarController notchBottomBarController =
      NotchBottomBarController(index: 0);

  // icon labels

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      removeMargins: true,
      notchGradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.red,
          Colors.green,
        ],
      ),
      notchColor: Colors.white,
      color: Colors.amber,
      bottomBarWidth: MediaQuery.of(context).size.width,
      bottomBarHeight: 80,
      notchBottomBarController: notchBottomBarController,
      onTap: (int value) {
        currentIndex = value;
        changeState();
      },
      bottomBarItems: const [
        //First Item
        BottomBarItem(
          inActiveItem: Icon(
            Icons.document_scanner_outlined,
            color: Colors.blueGrey,
          ),
          activeItem: Icon(
            Icons.document_scanner,
            color: Colors.blueAccent,
          ),
          itemLabel: 'Overview',
        ),
        //Second Item
        BottomBarItem(
          inActiveItem: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.blueGrey,
          ),
          activeItem: Icon(
            Icons.shopping_cart,
            color: Colors.blueAccent,
          ),
          itemLabel: 'Groceries',
        ),
        //ThirdItem
        BottomBarItem(
          inActiveItem: Icon(
            Icons.cloud_outlined,
            color: Colors.blueGrey,
          ),
          activeItem: Icon(
            Icons.cloud,
            color: Colors.blueAccent,
          ),
          itemLabel: 'Weather',
        ),
        //Fourth Item
        BottomBarItem(
          inActiveItem: Icon(
            Icons.edit_document,
            color: Colors.blueGrey,
          ),
          activeItem: Icon(
            Icons.edit_document,
            color: Colors.blueAccent,
          ),
          itemLabel: 'Bills',
        ),
        //Fifth Item
        BottomBarItem(
          inActiveItem: Icon(
            Icons.person_2_outlined,
            color: Colors.blueGrey,
          ),
          activeItem: Icon(
            Icons.person_2_outlined,
            color: Colors.blueAccent,
          ),
          itemLabel: 'Profile',
        ),
      ],
      kBottomRadius: 0,
      kIconSize: 20,
    );
  }
}
