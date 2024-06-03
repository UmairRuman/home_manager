import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/add_item_button.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/groceries_list.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  static const _buttonSpacingFromRight = 0.05;
  static const _buttonSpacingFromBottom = 0.02;
  static const groceries = <GroceryModel>[
    GroceryModel(
        index: 0,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 1,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 2,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 3,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 4,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 5,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 6,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 7,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 8,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
    GroceryModel(
        index: 9,
        itemPrice: 200,
        itemName: 'Milk',
        totalQuantity: 10,
        icon: Icons.mail_lock_outlined),
  ];
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Stack(
            children: [
              const GroceriesList(groceries: groceries),
              Positioned(
                  bottom: height * _buttonSpacingFromBottom,
                  right: width * _buttonSpacingFromRight,
                  child: const AddNewItemButton())
            ],
          ),
        ),
      ),
    );
  }
}
