import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_controller.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/model/utility_bill_item.dart';
import 'package:flutter_project_home_manager/utils/dummy_list_of_utilities.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UtiiltiesPageList extends ConsumerWidget {
  const UtiiltiesPageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width) = MediaQuery.sizeOf(context);
    var controller = ref.read(utilityPageProvider.notifier);
    ref.watch(utilityPageProvider);
    // var listOfBills = controller.listOfItems;
    var listOfBills = DummyUtilitiesList.generate();
    return ListView.builder(
      itemCount: listOfBills.length,
      itemBuilder: (context, index) {
        UtiltityBillItem currentItem = listOfBills[index];
        return Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05),
                border: Border.all(color: Colors.blue)),
            child: ExpansionTile(
              leading: Icon(
                  controller.iconAgainstBillCatogary(currentItem.billType)),
              title: Text(
                currentItem.billType.toString(),
                style: TextStyle(color: Colors.black, fontSize: width * 0.06),
              ),
              subtitle: Text(
                currentItem.dateTime.convertToString(),
                style:
                    TextStyle(color: Colors.blueAccent, fontSize: width * 0.04),
              ),
              trailing: Text(
                currentItem.paidAmount.toString(),
                style:
                    TextStyle(color: Colors.blueGrey, fontSize: width * 0.05),
              ),
              expansionAnimationStyle: AnimationStyle(
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 1)),
              children: [
                Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppCommonButton(
                          width: width * 0.4,
                          backgroundColor: Colors.blue,
                          buttonText: 'update bill',
                          onClick: () {
                            controller.listItemUpdate(context, index);
                          },
                          buttonIcon: Icons.update),
                      AppCommonButton(
                          width: width * 0.4,
                          backgroundColor: Colors.red,
                          buttonText: 'Delete bill',
                          onClick: () {
                            controller.listItemDelete(context, index);
                          },
                          buttonIcon: Icons.delete),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
