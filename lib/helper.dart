import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'data/api/model/api_task_list.dart';

List<ApiTask> apiTaskListConverter(List<dynamic> map) {
  List<ApiTask> result = [];
  for (var item in map) {
    result.add(ApiTask.fromApi(item));
  }
  return result;
}

String getStringDate(DateTime date) {
  return DateFormat("yyyy-MM-dd").format(date);
}

void showAlert(
    {required BuildContext context,
    String title = 'Ошибка',
    required String message}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ок'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
