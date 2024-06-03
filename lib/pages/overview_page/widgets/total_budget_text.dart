import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalBudgetText extends ConsumerWidget {
  const TotalBudgetText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(overviewPageProvider.notifier);
    var Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: width * 0.05, bottom: width * 0.01),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Total Budget : ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: controller.totalBudgetText.toString(),
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
