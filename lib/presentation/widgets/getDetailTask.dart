import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:task_garage/domain/model/task_action.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/repository/tasks.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/helper.dart';
import 'package:task_garage/interal/dependencies/repository_module.dart';
import 'package:task_garage/presentation/widgets/itemBody.dart';
import 'package:task_garage/presentation/widgets/stuckBadge.dart';
import 'package:task_garage/presentation/widgets/taskBlockAlert.dart';
import '../../config.dart';
import 'dealParamsListWidget.dart';
import 'infoBadge.dart';

List<Widget> getDetailTask({
  required TaskDetail? taskDetail,
  required BuildContext context,
  required Task task,
}) {

  NextTask? _nextTask = taskDetail?.nextTask;
  Map<String, dynamic>? _params = taskDetail?.deal?.params;
  Map<String, dynamic>? _products= taskDetail?.deal?.products;

  TasksRepository _setTasksRepository = RepositoryModule.setTasksRepository();

  void _stuckOnPressed() {
    showDialog(
        context: context,
        builder: (_) {
          inspect(context);
          return TaskBlockAlertWidget(
            taskId: task.id,
            context: context,
          );
        });
    // };
  }

  void _finishOnPressed(){
    context.read<AppProvider>().setLoader(true);
    _setTasksRepository
        .setTasksAction(
        taskActionRequest: TaskActionRequest(
            action: 'finished',
            taskId: task.id))
        .then((value) {
      context.read<AppProvider>().setLoader(false);
      context.read<TaskListProvider>().refreshTaskList(context);
    });
  }

  void _finishRestoreOnPressed(){
    context.read<AppProvider>().setLoader(true);
    _setTasksRepository
        .setTasksAction(
        taskActionRequest: TaskActionRequest(
            action: 'wait',
            taskId: task.id))
        .then((value) {
      context.read<AppProvider>().setLoader(false);
      context.read<TaskListProvider>().refreshTaskList(context);
    });
  }

  if (taskDetail == null) return [];

  return [
    const Icon(Icons.keyboard_arrow_down),
    if (task.status == 'finished') ElevatedButton(onPressed: _finishRestoreOnPressed, child: const Text('Восстановить задачу'))
    else ElevatedButton(onPressed: _finishOnPressed, child: const Text('Завершить задачу')),
    ElevatedButton(
        onPressed: task.stuck == null ? _stuckOnPressed : null,
        child: const Text('Заблокировать задачу'),
        style: task.stuck == null
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
              )
            : null),
    const SizedBox(height: 10.0),
    if (task.stuck != null)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const StuckBadge(),
              const Text(' stop: '),
              Text(task.stuck?.masterName ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Colors.amber),
            child: TaskWidget(
                    name: task.stuck!.name,
                    status: task.stuck!.status,
                    start: task.stuck!.start,
                    end: task.stuck!.end,
                    generalInfo: task.stuck!.generalInfo,
                    deal: task.stuck!.deal,
                    mini: true)
                .getItem(),
          ),
        ],
      ),
    const SizedBox(height: 10.0),
    if (_params !=null) Row(children: [
      const Text('Менеджер '),
      const SizedBox(height: 10.0),
      Text(
        _params["manager"],
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    ]),
    const SizedBox(height: 10.0),
    if (task.info != null)
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration:
            const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Colors.white),
        child: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          const InfoBadge(),
          const SizedBox(width: 10.0),
          Text(task.info ?? '', style: TextStyle(fontSize: fontSizes.mini)),
        ]),
      ),
    if (task.info != null) const SizedBox(height: 10.0),
    if (task.managerNote != null && _params != null)
      Container(
          padding: const EdgeInsets.all(10.0),
          decoration:
              const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Colors.white),
          child: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
            const InfoBadge(),
            const SizedBox(width: 10.0),
            Text(_params['managernote'], style: TextStyle(fontSize: fontSizes.mini)),
          ])),
    if (task.managerNote != null) const SizedBox(height: 10.0),
    if (_products != null) paramsListWidget(params: _products[getProductIndex(dealName: task.deal)]),
    const SizedBox(height: 10.0),
    if (_params != null) paramsListWidget(params: _params),

    if (_nextTask != null) const SizedBox(height: 10.0),
    if (_nextTask != null)
      Row(
        children: [
          const Text('Следующая задача: '),
          const SizedBox(height: 10.0),
          Text(
            _nextTask.masterName!.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    const SizedBox(height: 10.0),
    if (_nextTask != null) Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Colors.white),
      child: TaskWidget(
          name: _nextTask.name,
          status: _nextTask.status,
          start: _nextTask.start,
          end: _nextTask.end,
          generalInfo: _nextTask.generalInfo,
          deal: _nextTask.deal,
          mini: true)
          .getItem(),
    ),
    const SizedBox(height: 10.0),
    const Icon(Icons.keyboard_arrow_up),
  ];
}
