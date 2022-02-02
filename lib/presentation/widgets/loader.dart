import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20.0,
        height: 20.0,
        padding: const EdgeInsets.all(15.0),
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2.0,
        ));
  }
}
