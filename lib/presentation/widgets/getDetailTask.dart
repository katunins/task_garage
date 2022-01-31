import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/presentation/widgets/taskBlockAlert.dart';

List<Widget> getDetailTask(
    {required TaskDetail? taskDetail,
    required BuildContext context,
    required Task task,
    }) {
  if (taskDetail == null) return [];

  return [
    const Icon(Icons.keyboard_arrow_down),
    ElevatedButton(onPressed: () {}, child: const Text('Завершить задачу')),
    ElevatedButton(
        onPressed: task.stuck == null
            ? () {
                showDialog(
                    context: context,
                    builder: (BuildContext childContext) {
                      return TaskBlockAlertWidget(
                        taskId: task.id,
                        context: context
                      );
                    });
              }
            : null,
        child: const Text('Заблокировать задачу'),
        style: task.stuck == null
            ? ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black87),
              )
            : null),
    // const SizedBox(height: 10.0),
    // Text('Менеджер ' + detail["deal"]["params"]["manager"]),
    // const SizedBox(height: 10.0),
    // ProductParamsWidget(
    //     productParams: detail["deal"]["products"]
    //     [getIndexFromDealName(item['deal'])])
  ];
}
