import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/update_dailog.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/grocery_list_tile_leading.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/grocery_list_tile_trailing.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/update_delete_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryListTile extends ConsumerWidget {
  const GroceryListTile({
    super.key,
    required this.groceryItem,
    required this.index,
  });
  final GroceryModel groceryItem;
  final int index;
  static const updateDetailsbtnText = 'Update Details';
  static const deleteItembtnText = 'Delete Item';
  static const borderRadius = 20.0;
  static const _boxWidth = 0.95;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(groceriesProvider);
    final shouldExpand =
        ref.read(groceriesProvider.notifier).currentTileIndex == index;
    final Size(:width) = MediaQuery.sizeOf(context);
    return Center(
      child: SizedBox(
        width: width * _boxWidth,
        child: ExpansionTile(
          leading: ListTileLeading(
              itemName: groceryItem.itemName,
              totalQuantity: groceryItem.totalQuantity),
          initiallyExpanded: shouldExpand,
          onExpansionChanged: (value) {
            
          },
          textColor: Colors.white,
          collapsedTextColor: Colors.white,
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          collapsedShape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          collapsedBackgroundColor: Colors.blue.shade300,
          backgroundColor: Colors.blue.shade300,
          title: ListTileTrailing(
              icon: groceryItem.icon,
              remaining: groceryItem.usedQuantity,
              ),
          children: [
            ListTile(
              title: Center(
                child: Row(
                  children: [
                    Expanded(
                        flex: 10,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: UpdateDeleteButton(
                            btnText: updateDetailsbtnText,
                            onBtnTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return UpdateDialog(index: index , totalItem: groceryItem.totalQuantity,usedItem: groceryItem.usedQuantity,);
                                },
                              );
                            },
                          ),
                        )),
                    const Spacer(),
                    Expanded(
                        flex: 10,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: UpdateDeleteButton(
                              onBtnTap: () {
                                
                              },
                              btnText: deleteItembtnText),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
