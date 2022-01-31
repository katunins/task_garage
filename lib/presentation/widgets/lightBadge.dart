import 'package:flutter/material.dart';

class LightBadge extends StatelessWidget {
  const LightBadge({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2.0),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}
