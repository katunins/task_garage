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

String getStringDate({required DateTime date, bool? forServer}) {
  return DateFormat(forServer != null ? "yyyy-MM-dd" : "dd.MM.yyyy").format(date);
}

Future<void> showMyDialog(
    {required BuildContext context,
    String? title,
    required Widget content,
    String? closeButtonText,
    TextButton? textButton}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? 'Ошибка'),
        content: content,
        actions: <Widget>[
          if (textButton != null) textButton,
          TextButton(
            child: Text(closeButtonText ?? 'Ок'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

// сверяет задачи сделки с нынешней
bool getDeadlineAlert({required DateTime endDate, required int buffer}) {
  DateTime deadlineDateTime = endDate;
  deadlineDateTime.add(Duration(minutes: buffer));
  return deadlineDateTime.compareTo(DateTime.now()) < 0;
}
