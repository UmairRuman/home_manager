import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/home_page/controller/home_page_controller.dart';
import 'package:flutter_project_home_manager/utils/bottom_navigation_bar_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageBottomNavigationBar extends ConsumerWidget {
  const HomePageBottomNavigationBar({super.key});

  // icon labels

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(homePageProvider.notifier);
    var Size(:width, :height) = MediaQuery.sizeOf(context);    
    return AnimatedNotchBottomBar(      
      removeMargins: true,
      notchColor: Colors.white,
      elevation: 0,      
      color: Colors.white,
      bottomBarWidth: MediaQuery.of(context).size.width,
      bottomBarHeight: height * 0.1,
      notchBottomBarController: controller.notchBottomBarController,
      onTap: controller.onStateChange,
      bottomBarItems: BottomNavigationBarItems.listOfBottomBarItems,
      kBottomRadius: 0,
      kIconSize: width * 0.06,
    );
  }
}
