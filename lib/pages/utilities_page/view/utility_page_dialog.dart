import 'package:flutter/material.dart';

import 'package:flutter_project_home_manager/pages/utilities_page/widgets/add_button_in_dialog.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/date_picker_dialog.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/dialog_text.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/drop_down_menu_button.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/payment_text_form_field.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/update_button_in_dialog.dart';

enum DialogCallType { addNewBill, udateExistingBill }

class UtiltiyPageDialog extends StatelessWidget {
  final DialogCallType dialogCallType;

  const UtiltiyPageDialog({super.key, required this.dialogCallType});
  @override
  Widget build(BuildContext context) {
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    return Center(
      child: SizedBox(
        width: width * 0.8,
        height: height * 0.5,
        child: Material(
          color: Colors.transparent,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.08),
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 2),
                const Expanded(flex: 4, child: DialogText(text: 'Paid Date')),
                const Spacer(),
                const Expanded(flex: 8, child: DialogBillDatePicker()),
                const Spacer(flex: 4),
                const Expanded(flex: 4, child: DialogText(text: 'Bill Type')),
                const Spacer(),
                const Expanded(flex: 8, child: DropDownBillButton()),
                const Spacer(flex: 4),
                const Expanded(flex: 4, child: DialogText(text: 'Paid Amount')),
                const Spacer(),
                Expanded(flex: 12, child: PaymentTextFormField(width: width)),
                const Spacer(flex: 4),
                Expanded(
                    flex: 8,
                    child: Builder(builder: (context) {
                      return switch (dialogCallType) {
                        DialogCallType.addNewBill => AddItemDialogButton(dialogContext: context),
                        DialogCallType.udateExistingBill =>
                          UpdateItemDialogButton(
                            dialogContext: context,
                          ),
                      };
                    })),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
