import 'package:flutter/material.dart';

class ListTileTrailing extends StatelessWidget {
  const ListTileTrailing(
      {super.key, required this.icon, required this.remaining});
  final IconData icon;
  final int remaining;
  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    final textStyle = TextStyle(color: Colors.white, fontSize: height * 0.02);
    return SizedBox(
      height: height * 0.1,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              size: height * 0.03,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                'Used:$remaining',
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
