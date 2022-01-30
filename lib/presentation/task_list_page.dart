import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/state/date_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/presentation/widgets/bottomBar.dart';
import 'package:task_garage/presentation/widgets/header.dart';
import 'package:task_garage/presentation/widgets/item.dart';

import '../helper.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key, this.expandDetailId}) : super(key: key);

  final int? expandDetailId;

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    TaskListProvider _taskListState = Provider.of<TaskListProvider>(context);
    List<Task> _tasks = _taskListState.taskList.tasks;

    Future<void> _onRefresh() async {
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
                Task task = _tasks[index];
                return GestureDetector(
                  child: ItemTask(
                    task: task,
                    isDeadlineAlert: getDeadlineAlert(
                        endDate: task.end, buffer: task.buffer),
                    expandDetail: widget.expandDetailId != null
                        ? widget.expandDetailId == task.id
                        : false,
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
