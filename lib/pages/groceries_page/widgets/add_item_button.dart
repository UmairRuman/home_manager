import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/view/add_new_item_dialog.dart';

class AddNewItemButton extends StatelessWidget {
  const AddNewItemButton({super.key});

  static const _btnWidth = 0.15;
  static const _btnHeight = 0.07;
  static const _btnBlurRadius = 5.0;
  static const _btnSpreadRadius = 2.0;

  static const shadowOffset = Offset(1, 1);

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AddNewExpenseItemDialog();
          },
        );
      },
      child: SizedBox(
          width: width * _btnWidth,
          height: height * _btnHeight,
          child: const DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: _btnBlurRadius,
                    spreadRadius: _btnSpreadRadius,
                    offset: shadowOffset,
                  ),
                ]),
            child: Icon(
              Icons.add,
              color: Colors.blue,
            ),
          )),
    );
  }
}
