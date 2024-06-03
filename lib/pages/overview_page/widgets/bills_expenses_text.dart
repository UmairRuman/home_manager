import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BillsExpensesText extends ConsumerWidget {
  const BillsExpensesText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(overviewPageProvider.notifier);
    var Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Bills Expenses : ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: controller.utilityBillsExpenseText.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: width * 0.05,
              ),
            )
          ],
        ),
      ),
    );
  }
}
