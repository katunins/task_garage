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
import 'package:task_garage/presentation/widgets/loader.dart';

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
    TaskListProvider _taskListState = context.watch<TaskListProvider>();
    bool _isLoader = context.watch<AppProvider>().loader;
    String? _searchFilter = _taskListState.searchFilter;

    List<Task> _filteredTasks = _searchFilter != null
        ? _taskListState.taskList.tasks
            .where((element) =>
                element.deal.contains(_searchFilter) ||
                element.name.contains(_searchFilter) ||
                element.generalInfo.contains(_searchFilter))
            .toList()
        : _taskListState.taskList.tasks;

    Future<void> _onRefresh() async {
      context.read<TaskListProvider>().refreshTaskList(context);
    }

    // Клик по задаче из списка - раскрыавет детальную информацию
    Future<void> _onTap(Task _task) async {
      if (_taskDetail != null && _taskDetail?.taskId == _task.id) {
        setState(() {
          _taskDetail = null;
        });
      } else {
        context.read<AppProvider>().setLoader(true);
        TaskDetail? taskDetail = await _taskDetailRepository.getTaskDetail(taskId: _task.id);
        setState(() {
          _taskDetail = taskDetail;
        });
        context.read<AppProvider>().setLoader(false);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Header(),
        leading: _isLoader ? const Loader() : null,
      ),
      body: RefreshIndicator(
          child: ListView.builder(
              itemCount: _filteredTasks.length,
              itemBuilder: (context, int index) {
                Task _task = _filteredTasks[index];
                if (!context.watch<AppProvider>().showFinishedTasks && _task.status == 'finished') {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  child: ItemTask(
                    task: _task,
                    isDeadlineAlert: _task.status != 'finished' &&
                        getDeadlineAlert(endDate: _task.end, buffer: _task.buffer),
                    taskDetail: _taskDetail?.taskId == _task.id ? _taskDetail : null,
                  ),
                  onTap: () => _onTap(_task),
                );
              }),
          onRefresh: _onRefresh),
      bottomNavigationBar: const BottomBar(),
      drawer: const DrawerMenu(),
    );
  }
}
