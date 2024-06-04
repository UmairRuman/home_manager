import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_states.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/model/utility_bill_item.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/utility_page_dialog.dart';
import 'package:flutter_project_home_manager/services/database_services/local_db.dart';
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
  LocalDB db = LocalDB();

  // date picker in dialog icon button click (dialog)
  updateDateTime(DateTime selectedDate) {
    log('date and time updated');
    date = selectedDate;
    state = UtilityPageDialogDateAddedState();
  }

  // bill catogory drop down click (dialog)
  onDropDownValueChange(String? value) {    
    billType = value!;
    state = UtilityPageDialogCatogoryUpdatedState();    
  }

  // add new bill click (dialog)
  addItemToList(BuildContext dialogContext) async{
    
    if (dialogKey.currentState!.validate()) {    
      paidAmount = double.parse(paymentController.text);
      await db.insertUtilityBill(UtiltityBillItem(
          dateTime: date, billType: billType, paidAmount: paidAmount));
      listOfItems = await db.utilites();
      paymentController.text = '';
      billType = listOfBillCatogaries.first;
      date = DateTime.now();    
      Navigator.pop(dialogContext);
    }
    state = UtilityPageAddItemState();  
  }

  bool isDialogSubmited = false;
  int currentIndex = 0;
  // on list tile update button
  listItemUpdate(BuildContext context, int index) async{
    currentIndex = index;    
    if (!isDialogSubmited) {      
      billType = listOfItems[currentIndex].billType;
      date = listOfItems[currentIndex].dateTime;
      paidAmount = listOfItems[currentIndex].paidAmount;
      showDialog(
        context: context,
        builder: (context) => const UtiltiyPageDialog(
          dialogCallType: DialogCallType.udateExistingBill,
        ),
      );
    } else if (dialogKey.currentState?.validate() ?? false) {
      paidAmount = double.parse(paymentController.text); 
      var updatedBill = listOfItems[index].copyWith(dateTime: date , billType: billType,paidAmount: paidAmount);
      await db.updateUtilityBill(updatedBill);
      listOfItems = await db.utilites();      
      paymentController.text = '';
      billType = listOfBillCatogaries.first;
      date = DateTime.now();      
      state = UtilityPageUpdateItemState();      
      Navigator.pop(context);
      isDialogSubmited = false;
    }
  }

  listItemUpdateDialogSubmitButtonClick(BuildContext context) {
    log('list item dialog on updated button clicked');
    isDialogSubmited = true;
    listItemUpdate(context, currentIndex);
  }

  // on list tile delete button
  listItemDelete(BuildContext context, int index) async{
    log(listOfItems.toString());
    var currentUtility = listOfItems[index];    
    await db.deleteUtitliyBill(currentUtility);
    listOfItems = await db.utilites();      
    state = UtilityPageRemoveItemState();
  }

  fetchUtilityBills() async{    
    listOfItems = await db.utilites();     
    state = UtilityPageAddItemState(); 
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
