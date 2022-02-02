import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_garage/helper.dart';

Widget paramsListWidget({required Map<String, dynamic> params}) {

  return Container(
      padding: const EdgeInsets.all(10.0),
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getParamsListWidget(params),
      ));
}

// Lis
