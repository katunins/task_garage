import 'package:code_input/code_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget codeInputWidget(Function(String) onFilled) {
  Size _size = const Size(50.0, 60.0);
  BoxDecoration _boxDecoration = BoxDecoration(
      border: Border.all(color: Colors.black26), borderRadius: const BorderRadius.all(Radius.circular(5.0)));

  return CodeInput(
    length: 4,
    keyboardType: TextInputType.number,
    spacing: 12,
    onFilled: onFilled,
    onDone: onFilled,
    builder: CodeInputBuilders.containerized(
      totalSize: _size,
      emptySize: _size,
      filledSize: _size,
      emptyDecoration: _boxDecoration,
      filledDecoration: _boxDecoration,
      emptyTextStyle: const TextStyle(),
      filledTextStyle: const TextStyle(fontSize: 25.0),
    ),
  );
}
