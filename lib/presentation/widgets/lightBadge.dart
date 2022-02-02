import 'package:flutter/material.dart';
import 'package:task_garage/config.dart';

class LightBadge extends StatelessWidget {
  LightBadge({Key? key, required this.text,
    this.mini = false}) : super(key: key);
  final String text;
  bool? mini;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2.0),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: mini! ? fontSizes.mini : null )),
    );
  }
}
