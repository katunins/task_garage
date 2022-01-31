import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
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
  final

  DateTime get date => _date;

  String get stringDate => getStringDate(date: _date);

  String get weekDay => weekDays[_date.weekday] ?? '';

  void _taskListUpdate({
    required BuildContext context,
    required int userId,
  }) {
    // UserProvider _userState = Provider.of<UserProvider>(context, listen: false);
    AppProvider _appState = Provider.of<AppProvider>(context, listen: false);
    TaskListProvider _taskListState =
        Provider.of<TaskListProvider>(context, listen: false);
    _appState.setLoader(true);
    _taskListState
        .getTaskList(TaskListRequest(date: _date, userId: userId))
        .then((value) => _appState.setLoader(false));
    // }
  }

  void nextDay(BuildContext context) {
    _date = _date.add(const Duration(days: 1));
    notifyListeners();
    _taskListUpdate(context);
  }

  void today(BuildContext context) {
    _date = DateTime.now();
    notifyListeners();
    _taskListUpdate(context);
  }

  void prevDay(BuildContext context) {
    _date = _date.subtract(const Duration(days: 1));
    notifyListeners();
    _taskListUpdate(context);
  }

  Future<void> showPicker(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2025));
  }
}
