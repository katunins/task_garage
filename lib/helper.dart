import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getStringDate({required DateTime date, bool? forServer}) {
  return DateFormat(forServer != null ? "yyyy-MM-dd" : "dd.MM.yyyy").format(date);
}

Future<void> showAlertDialog(
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

/// определяет вышел наступил ли дедлайн задачи
bool getDeadlineAlert({required DateTime endDate, required int buffer}) {
  DateTime deadlineDateTime = endDate;
  deadlineDateTime.add(Duration(minutes: buffer));
  return deadlineDateTime.compareTo(DateTime.now()) < 0;
}

String getTimeFromDateTime(DateTime date) {
  DateFormat format = DateFormat("hh:mm");
  return format.format(date);
}

String getDifferenceInTime(DateTime startDate, DateTime endDate) {
  var diff = endDate.difference(startDate).inMinutes;
  return '$diff мин';
}

/// создает список элемент с параметрами продукта
List<Widget> getParamsListWidget(Map<String, dynamic> product) {
  List<Widget> result = [];
  product.forEach((key, value) {
    result.add(Wrap(
      alignment: WrapAlignment.start,
      children: [
        Text(key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
        if (value!= null) const Text(': ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
        if (value!= null) Text(value.toString(), style: const TextStyle(fontSize: 12.0)),
      ],
    ));
  });
  return result;
}

/// возвращает номер продукта из названия сделки
String getProductIndex({required String dealName}) {
  List<String> arr = dealName.split('/');
  return arr.length>1 ? arr.last : '1';
}
