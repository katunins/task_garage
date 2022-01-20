import 'package:flutter/cupertino.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/repository/task_list.dart';

class TaskListProvider with ChangeNotifier {
  TaskListProvider(this._taskListRepository);

  final TaskListRepository _taskListRepository;

  TaskList? _taskList;
  TaskList? get taskList => _taskList;

  Future<void> getTaskList(TaskListRequest taskListRequest) async {
    final TaskList taskList = await _taskListRepository.getTaskList(taskListRequest: taskListRequest);
    _taskList = taskList;
    notifyListeners();
  }
}
