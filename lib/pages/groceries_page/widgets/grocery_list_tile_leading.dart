import 'package:flutter/material.dart';

class ListTileLeading extends StatelessWidget {
  const ListTileLeading(
      {super.key, required this.itemName, required this.totalQuantity});
  final String itemName;
  final int totalQuantity;
  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    final textStyle = TextStyle(color: Colors.white, fontSize: height * 0.018);
    return SizedBox(
      height: height * 0.05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                itemName,
                style: textStyle,
              )),
          Expanded(
              flex: 1, child: Text('Total :$totalQuantity', style: textStyle)),
        ],
      ),
    );
  }
}
