import 'package:flutter/material.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/presentation/widgets/getDetailTask.dart';
import 'package:task_garage/presentation/widgets/itemBody.dart';
import 'package:task_garage/presentation/widgets/stuckBadge.dart';

import '../../helper.dart';
import 'dealBadge.dart';
import 'infoBadge.dart';
import 'lightBadge.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({Key? key, required this.task, required this.isDeadlineAlert, required this.taskDetail})
      : super(key: key);

  final Task task;
  final bool isDeadlineAlert;
  final TaskDetail? taskDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isDeadlineAlert ? Colors.red[100] : Colors.grey[200],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          itemBody(task: task),
          ...getDetailTask(taskDetail: taskDetail, context: context, task: task),
        ],
      ),
    );
  }
}
