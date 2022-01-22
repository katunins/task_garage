import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/domain/state/user_provider.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserProvider userState = Provider.of<UserProvider>(context);

    TaskListProvider taskListState = Provider.of<TaskListProvider>(context, listen: false);
    taskListState.getTaskList(TaskListRequest(date: '2022-01-20', userId: userState.user.id));

        // .then((value) => {print(_taskListProvider.taskList?.tasks.length)});
    // print(_taskListProvider.taskList);
    return Container();
  }
}
