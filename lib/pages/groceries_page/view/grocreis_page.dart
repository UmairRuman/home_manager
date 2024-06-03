import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/quantity_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/add_item_button.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/dummy_list.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/groceries_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryPage extends ConsumerWidget {
  const GroceryPage({super.key});

  static DummyList dummyList = DummyList();

  static const _buttonSpacingFromRight = 0.05;
  static const _buttonSpacingFromBottom = 0.14;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(quantitiesProvider);
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Stack(
            children: [
              GroceriesList(groceries: dummyList.dummyList),
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
