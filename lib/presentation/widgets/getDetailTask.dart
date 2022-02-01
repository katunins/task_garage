import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/presentation/widgets/itemBody.dart';
import 'package:task_garage/presentation/widgets/taskBlockAlert.dart';

List<Widget> getDetailTask({
  required TaskDetail? taskDetail,
  required BuildContext context,
  required Task task,
}) {
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

  if (taskDetail == null) return [];

  return [
    const Icon(Icons.keyboard_arrow_down),
    ElevatedButton(onPressed: () {}, child: const Text('Завершить задачу')),
    ElevatedButton(
        onPressed: task.stuck == null ? _stuckOnPressed : null,
        child: const Text('Заблокировать задачу'),
        style: task.stuck == null
            ? ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black87),
              )
            : null),
    const SizedBox(height: 10.0),
    if (task.stuck != null) itemBody(task: task.stuck),
    Row(children: [
      const Text('Менеджер '),
      Text(
        taskDetail.deal.params["manager"],
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    ]),
    const SizedBox(height: 10.0),
    // ProductParamsWidget(
    //     productParams: detail["deal"]["products"]
    //     [getIndexFromDealName(item['deal'])])
  ];
}
