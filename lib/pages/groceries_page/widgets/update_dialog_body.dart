import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/quantity_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/update_dialog_row_design.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogBody extends ConsumerWidget {
  const DialogBody({super.key, required this.index});

  static const totalItems = 'Total Items';
  static const usedItems = 'Used Items';
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(quantitiesProvider);
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: UpdateDialogRowDesign(
                index: index,
                text: totalItems,
                onAddBtnTap: () {
                  ref
                      .read(quantitiesProvider.notifier)
                      .increaseTotalOfItem(index);
                },
                onMinusBtnTap: () {
                  ref
                      .read(quantitiesProvider.notifier)
                      .decreaseTotalOfItem(index);
                },
                quantityText: ref.read(quantitiesProvider)[index].total)),
        Expanded(
            flex: 1,
            child: UpdateDialogRowDesign(
                index: index,
                text: usedItems,
                onAddBtnTap: () {
                  ref
                      .read(quantitiesProvider.notifier)
                      .increaseTotalUsedOfItem(index);
                },
                onMinusBtnTap: () {
                  ref
                      .read(quantitiesProvider.notifier)
                      .decreaseTotalUsedOfItem(index);
                },
                quantityText: ref.read(quantitiesProvider)[index].used)),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: Colors.white,
        size: height * 0.025,
      ),
    );
  }
}
