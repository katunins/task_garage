import 'package:flutter/material.dart';

import '../../config.dart';

class DealNameBadge extends StatelessWidget {
  DealNameBadge({Key? key, required this.text, required this.isActive, this.mini = false}) : super(key: key);
  final String text;
  final bool isActive;
  bool? mini;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? Colors.lightGreen[300] : Colors.grey[500]),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: mini!? fontSizes.mini : null),
      ),
    );
  }
}
