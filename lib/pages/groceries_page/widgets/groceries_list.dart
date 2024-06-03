import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/quantity_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/quantity_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/view/grocery_item_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceriesList extends ConsumerWidget {
  const GroceriesList({super.key, required this.groceries});
  final List<GroceryModel> groceries;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (context, index) {
        SchedulerBinding.instance.addPostFrameCallback(
          (timeStamp) {
            ref.read(quantitiesProvider.notifier).addNewItemQuantities(
                QuantityModel(
                    itemPrice: groceries[index].itemPrice,
                    index: index,
                    total: groceries[index].totalQuantity,
                    used: 0,
                    isExpanded: false));
          },
        );
        if (index == groceries.length - 1) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: GroceryListTile(
                  groceryItem: groceries[index],
                ),
              ),
              const ListTile()
            ],
          );
        }
        return Padding(
          padding: EdgeInsets.only(top: height * 0.01),
          child: GroceryListTile(
            groceryItem: groceries[index],
          ),
        );
      },
    );
  }
}
