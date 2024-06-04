
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_state.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final overviewPageProvider =
    NotifierProvider<OverviewPageController, OverviewPageStates>(
        OverviewPageController.new);

class OverviewPageController extends Notifier<OverviewPageStates> {
  String budgetFieldText = '';  
  double totalBudgetText = 0.0;
  double groceryExpenseText = 0.0;
  double utilityBillsExpenseText = 0.0;
  double remainingBalanceText = 0.0;

  @override
  OverviewPageStates build() {
    return OverviewPageInitialState();
  }

  updateFieldText(String currentText){
    budgetFieldText = currentText;
  }

  saveTotalBudget(){
    var preferences = GetIt.I<SharedPreferences>();
    preferences.setDouble(SharedPreferencesConstant.kTotalBudget , double.tryParse(budgetFieldText) ?? 0.0);

  }
}
