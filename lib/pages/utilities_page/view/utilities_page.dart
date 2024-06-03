import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/view/utilites_page_list.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/view/utility_page_dialog.dart';

class UtilityPage extends StatelessWidget {
  const UtilityPage({super.key});
  static const pageAddress = '/utilityPage';
  @override
  Widget build(BuildContext context) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: width * 0.94,
              height: height * 0.95,
              child: const UtiiltiesPageList()),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: width * 0.28, right: width * 0.05),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const UtiltiyPageDialog(
                dialogCallType: DialogCallType.addNewBill,
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
