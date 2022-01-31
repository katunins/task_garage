import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_action.dart';
import 'package:task_garage/domain/repository/tasks.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/interal/dependencies/repository_module.dart';

class TaskBlockAlertWidget extends StatefulWidget {
  const TaskBlockAlertWidget(
      {Key? key, required this.taskId, required this.context})
      : super(key: key);
  final int taskId;
  final BuildContext context;

  @override
  _TaskBlockAlertWidgetState createState() => _TaskBlockAlertWidgetState();
}

class _TaskBlockAlertWidgetState extends State<TaskBlockAlertWidget> {
  _TaskBlockAlertWidgetState();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(_) {
    TasksRepository _setTasksRepository = RepositoryModule.setTasksRepository();
    AppProvider _appState = Provider.of<AppProvider>(widget.context, listen: false);
    TaskListProvider _taskListState =
        Provider.of<TaskListProvider>(widget.context, listen: false);

    void _onSaved(String? message) {
      _appState.setLoader(true);
      _setTasksRepository
          .setTasksAction(
              taskActionRequest: TaskActionRequest(
                  action: 'mastermessage',
                  message: message,
                  taskId: widget.taskId))
          .then((value) {
        _appState.setLoader(false);
        _taskListState.refreshTaskList(widget.context);
        Navigator.of(context, rootNavigator: true).pop('dialog');
      });
    }

    return AlertDialog(
      alignment: Alignment.center,
      title: const Center(child: Text("Блокировка задачи")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              style: const TextStyle(fontSize: 13.0),
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Опишите причину блокировки задачи',
                filled: true,
                fillColor: Color.fromRGBO(240, 240, 240, 1),
                border: InputBorder.none,
              ),
              // textAlign: TextAlign.center,
              maxLines: 5,
              scrollPadding: const EdgeInsets.all(20.0),
              onSaved: _onSaved,
            ),
          )
        ],
      ),
      actionsOverflowButtonSpacing: 120,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            _formKey.currentState?.save();
          },
          child: const Text('Заблокировать'),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          child: const Text('Отменить'),
        ),
      ],
    );
  }
}
