import 'package:flutter/material.dart';

class InfoBadge extends StatelessWidget {
  const InfoBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      child: const Icon(Icons.info_outline, color: Colors.lightGreen,),
    );
  }
}
