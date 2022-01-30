import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/state/date_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/presentation/widgets/header.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TaskListProvider _taskListState = Provider.of<TaskListProvider>(context);
    List<Task> _tasks = _taskListState.taskList.tasks;

    Future<void> _onRefresh () async {
      _taskListState.refreshTaskList(context);
    }


    return Scaffold(
      appBar: AppBar(
        title: const Header(),
      ),
      body: RefreshIndicator(
          child: ListView.builder(
              itemCount: _taskListState.taskList.tasks.length,
              itemBuilder: (context, int index) {
                // if (!_isShowFinishedTasks &&
                //     _tasks[index]['status'] == 'finished') {
                //   return const SizedBox.shrink();
                // }
                // bool isDeadlineAlert = getDeadlineAlert(
                //     _tasks[index]['end'], _tasks[index]['buffer']);

                return GestureDetector(
                  child: ItemTask(
                    item: _tasks[index],
                    isDeadlineAlert: isDeadlineAlert,
                    detail: _detailTask['id'] == _tasks[index]['id']
                        ? _detailTask
                        : {},
                  ),
                  onTap: () {
                    // switchDetailTask(_tasks[index]['id']);
                  },
                );
              }),
          onRefresh: _onRefresh),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
