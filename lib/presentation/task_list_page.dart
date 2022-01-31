import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/repository/tasks.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/interal/dependencies/repository_module.dart';
import 'package:task_garage/presentation/widgets/bottomBar.dart';
import 'package:task_garage/presentation/widgets/drawer.dart';
import 'package:task_garage/presentation/widgets/header.dart';
import 'package:task_garage/presentation/widgets/item.dart';

import '../helper.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {

  TaskDetail? _taskDetail;
  final TasksRepository _taskDetailRepository = RepositoryModule.taskDetailRepository();

  @override
  Widget build(BuildContext context) {
    TaskListProvider _taskListState = Provider.of<TaskListProvider>(context);
    AppProvider _appState = Provider.of<AppProvider>(context, listen: false);
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
                Task _task = _tasks[index];
                if (!_appState.showFinishedTasks && _task.status == 'finished') {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  child: ItemTask(
                    task: _task,
                    isDeadlineAlert: _task.status != 'finished' &&
                        getDeadlineAlert(endDate: _task.end, buffer: _task.buffer),
                    taskDetail: _taskDetail?.taskId == _task.id ? _taskDetail : null,
                  ),
                  onTap: () async {
                    if (_taskDetail != null && _taskDetail?.taskId == _task.id) {
                      setState(() {
                        _taskDetail = null;
                      });
                    } else {
                      _appState.setLoader(true);
                      TaskDetail? taskDetail = await _taskDetailRepository.getTaskDetail(taskId: _task.id);
                      if (taskDetail == null) return;
                      setState(() {
                        _taskDetail = taskDetail;
                      });
                      _appState.setLoader(false);
                    }
                  },
                );
              }),
          onRefresh: _onRefresh),
      bottomNavigationBar: const BottomBar(),
      drawer: const DrawerMenu(),
    );
  }
}
