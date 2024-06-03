import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_states.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/model/utility_bill_item.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/view/utility_page_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final utilityPageProvider =
    NotifierProvider<UtilityPageController, UtilityPageStates>(
        UtilityPageController.new);

class UtilityPageController extends Notifier<UtilityPageStates> {
  List<String> listOfBillCatogaries = <String>[
    'Electricity Bill',
    'Gas Bill',
    'Water Bill',
    'Internet Bill',
    'Cabel Bill',
    'Maintainance Bill',
    'Other Bill',
  ];

  //returns a Icon according to bill catagory
  IconData iconAgainstBillCatogary(String billCatagory) {
    return switch (billCatagory) {
      'Electricity Bill' => Icons.electric_bolt_rounded,
      'Gas Bill' => Icons.gas_meter_rounded,
      'Water Bill' => Icons.water_damage,
      'Internet Bill' => Icons.wifi,
      'Cabel Bill' => Icons.tv_rounded,
      'Maintainance Bill' => Icons.plumbing_rounded,
      'Other Bill' => Icons.emergency_rounded,
      _ => Icons.question_mark,
    };
  }

  // data member for list
  List<UtiltityBillItem> listOfItems = [];

  // data members for dialog
  GlobalKey<FormState> dialogKey = GlobalKey<FormState>();
  double paidAmount = 0.0;
  final TextEditingController paymentController = TextEditingController();
  DateTime date = DateTime.now();
  late String billType;

  // date picker in dialog icon button click (dialog)
  updateDateTime(DateTime selectedDate) {
    log('date and time updated');
    date = selectedDate;
    state = UtilityPageDialogDateAddedState();
  }

  // bill catogory drop down click (dialog)
  onDropDownValueChange(String? value) {
    log('catogory updated');
    billType = value!;
    state = UtilityPageDialogCatogoryUpdatedState();
    log('STATE UPDATED');
  }

  // add new bill click (dialog)
  addItemToList(BuildContext dialogContext) {
    log('add item to list button clicked');
    if (dialogKey.currentState!.validate()) {
      log('add item to list button validated successfully');
      paidAmount = double.parse(paymentController.text);
      listOfItems.add(UtiltityBillItem(
          dateTime: date, billType: billType, paidAmount: paidAmount));
      log('item added to list at ${listOfItems.length - 1} index');
      paymentController.text = '';
      billType = listOfBillCatogaries.first;
      date = DateTime.now();
      log('dialog values set to default');
      Navigator.pop(dialogContext);
    }
    state = UtilityPageAddItemState();
    log('STATE UPDATED');
  }

  bool isDialogSubmited = false;
  int currentIndex = 0;
  // on list tile update button
  listItemUpdate(BuildContext context, int index) {
    currentIndex = index;
    log('list Item update button clicked at index $index');

    if (!isDialogSubmited) {
      log('dialog showed to update values');
      billType = listOfItems[currentIndex].billType;
      date = listOfItems[currentIndex].dateTime;
      paidAmount = listOfItems[currentIndex].paidAmount;
      showDialog(
        context: context,
        builder: (context) => const UtiltiyPageDialog(
          dialogCallType: DialogCallType.udateExistingBill,
        ),
      );
    } else if (dialogKey.currentState!.validate()) {
      paidAmount = double.parse(paymentController.text);
      log('paid ammount has been parsed');
      listOfItems.removeAt(index);
      log('item at index $index has been removed');
      listOfItems.insert(
          index,
          UtiltityBillItem(
              dateTime: date, billType: billType, paidAmount: paidAmount));
      log(listOfItems.toString());
      log('item at index $index has been added');
      paymentController.text = '';
      billType = listOfBillCatogaries.first;
      date = DateTime.now();
      log('values set to default');
      state = UtilityPageUpdateItemState();

      log('STATE UPDATED');
      Navigator.pop(context);
    }
  }

  listItemUpdateDialogSubmitButtonClick(BuildContext context) {
    log('list item dialog on updated button clicked');
    isDialogSubmited = true;
    listItemUpdate(context, currentIndex);
  }

  // on list tile delete button
  listItemDelete(BuildContext context, int index) {
    log(listOfItems.toString());
    log('item delete button clicked at index $index');
    listOfItems.removeAt(index);
    state = UtilityPageRemoveItemState();
  }

  @override
  UtilityPageStates build() {
    billType = listOfBillCatogaries.first;
    ref.onDispose(() {
      paymentController.dispose();
    });

    return UtilityPageInitialState();
  }
}
