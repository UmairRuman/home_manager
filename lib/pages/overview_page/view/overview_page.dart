import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/total_budget_text_field.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/udpate_budget_button.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});
  static const pageAddress = '/overviewPage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/whiteTexturedBackground.jpg'),
                fit: BoxFit.fill,
                opacity: 0.7)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TotalBudgetTextField(),
              UpdateBudgetButton(),
              // TotalBudgetText(),
              // GroceryExpensesText(),
              // BillsExpensesText(),
              // RemainingBalanceText()
            ],
          ),
        ),
      ),
    );
  }
}
