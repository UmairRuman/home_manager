import 'package:flutter/material.dart';

class ListTileLeading extends StatelessWidget {
  const ListTileLeading(
      {super.key, required this.itemName, required this.totalQuantity});
  final String itemName;
  final int totalQuantity;
  static const _boxWidth = 0.5;
  static const _boxHeight = 0.1;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final textStyle = TextStyle(color: Colors.white, fontSize: height * 0.023);
    return SizedBox(
      width: width * _boxWidth,
      height: height * _boxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  itemName,
                  style: textStyle,
                ),
              )),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Total: $totalQuantity', style: textStyle))),
        ],
      ),
    );
  }
}
