import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_project_home_manager/pages/home_page/controller/home_page_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageProvider =
    NotifierProvider<HomePageController, HomePageState>(HomePageController.new);

class HomePageController extends Notifier<HomePageState> {
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController(index: 0);
  int currentIndex = 0;

  onStateChange(int value) {
    currentIndex = value;
    notchBottomBarController.jumpTo(value);
    state = HomePageSelectedItemChangeState();
  }

  @override
  HomePageState build() {
    return HomePageInitialState();
  }
}
