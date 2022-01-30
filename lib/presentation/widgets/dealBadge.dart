import 'package:flutter/material.dart';

class DealNameBadge extends StatelessWidget {
  const DealNameBadge({Key? key, required this.text, required this.isActive})
      : super(key: key);
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? Colors.lightGreen[300] : Colors.grey[500]),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
