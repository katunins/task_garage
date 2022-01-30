import 'package:flutter/material.dart';
import 'package:task_garage/domain/model/task_list.dart';

import 'dealBadge.dart';
import 'infoBadge.dart';

class ItemTask extends StatelessWidget {
  const ItemTask(
      {Key? key,
      required this.task,
      required this.isDeadlineAlert,
      required this.expandDetail})
      : super(key: key);

  final Task task;
  final bool isDeadlineAlert;
  final bool expandDetail;

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
          Row(
            children: [
              DealNameBadge(
                  text: task.deal, isActive: task.status != 'finished'),
              if (task.info != null) const InfoBadge(),
              // if (task['stuck'] != null) const StuckBadge(),
              Expanded(child: Container()),
              // LightBadge(text: getTimeFromString(task['start'])),
              // LightBadge(text: getDifference(task['start'], task['end'])),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(task.name,
              style: const TextStyle(fontWeight: FontWeight.w700)),
          Text(task.generalInfo,
              style: const TextStyle(fontWeight: FontWeight.w400)),
          // if (expandDetail) {}
          // ...getProductDetail(item: item, context: context, detail: detail),
        ],
      ),
    );
  }
}