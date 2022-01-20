import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TaskListProvider _taskListProvider = Provider.of<TaskListProvider>(context);
    _taskListProvider.getTaskList(TaskListRequest(date: '2022-01-20', userId: 2));
        // .then((value) => {print(_taskListProvider.taskList?.tasks.length)});
    // print(_taskListProvider.taskList);
    return Container();
  }
}
