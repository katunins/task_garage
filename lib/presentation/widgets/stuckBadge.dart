import 'package:flutter/material.dart';

class StuckBadge extends StatelessWidget {
  const StuckBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      child: const Icon(Icons.warning, color: Colors.orangeAccent),
    );
  }
}
