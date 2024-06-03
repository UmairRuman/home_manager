import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/quantity_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/view/update_dailog.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/Update_details_button.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/grocery_list_tile_leading.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/grocery_list_tile_trailing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryListTile extends ConsumerWidget {
  const GroceryListTile({super.key, required this.groceryItem});
  final GroceryModel groceryItem;

  static const borderRadius = 20.0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(quantitiesProvider);
    final Size(:width) = MediaQuery.sizeOf(context);
    return Center(
      child: SizedBox(
        width: width * 0.95,
        child: ExpansionTile(
          onExpansionChanged: (value) {
            ref
                .read(quantitiesProvider.notifier)
                .closeOtherTiles(groceryItem.index);
          },
          maintainState: true,
          textColor: Colors.white,
          collapsedTextColor: Colors.white,
          trailing: ListTileTrailing(
              icon: groceryItem.icon,
              remaining: ref
                  .read(quantitiesProvider)[groceryItem.index]
                  .used), ////runtime error//////
          collapsedShape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          collapsedBackgroundColor: Colors.blue.shade300,
          backgroundColor: Colors.blue.shade300,
          title: ListTileLeading(
              itemName: groceryItem.itemName,
              totalQuantity:
                  ref.read(quantitiesProvider)[groceryItem.index].total),
          children: [
            ListTile(
              title: Center(
                child: UpdateButton(
                  onBtnTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return UpdateDialog(index: groceryItem.index);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
