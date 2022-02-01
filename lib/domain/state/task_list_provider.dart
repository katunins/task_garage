import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/repository/tasks.dart';
import 'package:task_garage/domain/state/date_provider.dart';
import 'package:task_garage/domain/state/user_provider.dart';

class TaskListProvider with ChangeNotifier {
  TaskListProvider(this._taskListRepository);

  final TasksRepository _taskListRepository;

  late TaskList _taskList =
      TaskList(tasks: [], notFinished: NotFinished(deadline: 0, stuck: 0));

  TaskList get taskList => _taskList;

  Future<void> getTaskList(TaskListRequest taskListRequest) async {
    final TaskList taskList =
        await _taskListRepository.getTaskList(taskListRequest: taskListRequest);
    _taskList = taskList;
    notifyListeners();
  }

  void refreshTaskList(BuildContext context) {
    getTaskList(TaskListRequest(
        date: context.read<DateProvider>().date,
        userId: context.read<UserProvider>().user!.id));
  }
}
