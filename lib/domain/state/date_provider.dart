import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/domain/state/user_provider.dart';
import '../../helper.dart';

const weekDays = {
  1: 'Пн',
  2: 'Вт',
  3: 'Ср',
  4: 'Чт',
  5: 'Пт',
  6: 'Сб',
  7: 'Вс',
};

class DateProvider with ChangeNotifier {
  DateTime _date = DateTime.now();

  DateTime get date => _date;

  String get stringDate => getStringDate(date: _date);

  String get weekDay => weekDays[_date.weekday] ?? '';

  Future taskListUpdate(BuildContext context) async {
    await Future.delayed(const Duration());
    context.read<AppProvider>().setLoader(true);
    await context
        .read<TaskListProvider>()
        .getTaskList(TaskListRequest(date: _date, userId: context.read<UserProvider>().user!.id));
    context.read<AppProvider>().setLoader(false);
  }

  void nextDay(BuildContext context) {
    _date = _date.add(const Duration(days: 1));
    notifyListeners();
    taskListUpdate(context);
  }

  void today(BuildContext context) {
    _date = DateTime.now();
    notifyListeners();
    taskListUpdate(context);
  }

  void prevDay(BuildContext context) {
    _date = _date.subtract(const Duration(days: 1));
    notifyListeners();
    taskListUpdate(context);
  }

  void showPicker(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then((value) {
      _date = value!;
      notifyListeners();
      taskListUpdate(context);
    });
  }
}
