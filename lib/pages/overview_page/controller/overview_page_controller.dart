import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final overviewPageProvider =
    NotifierProvider<OverviewPageController, OverviewPageStates>(
        OverviewPageController.new);

class OverviewPageController extends Notifier<OverviewPageStates> {
  TextEditingController totalBudgetTextController = TextEditingController();
  double totalBudgetText = 0.0;
  double groceryExpenseText = 0.0;
  double utilityBillsExpenseText = 0.0;
  double remainingBalanceText = 0.0;

  @override
  OverviewPageStates build() {
    return OverviewPageInitialState();
  }
}
