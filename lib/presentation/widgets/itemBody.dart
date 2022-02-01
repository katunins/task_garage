import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/presentation/widgets/stuckBadge.dart';

import '../../helper.dart';
import 'dealBadge.dart';
import 'infoBadge.dart';
import 'lightBadge.dart';

Widget itemBody ({
  required Task task
})=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  Row(
    children: [
      DealNameBadge(text: task.deal, isActive: task.status != 'finished'),
      if (task.info != null) const InfoBadge(),
      if (task.stuck != null) const StuckBadge(),
      Expanded(child: Container()),
      LightBadge(text: getTimeFromDateTime(task.start)),
      LightBadge(text: getDifferenceInTime(task.start, task.end)),
    ],
  ),
  const SizedBox(height: 4.0),
  Text(task.name, style: const TextStyle(fontWeight: FontWeight.w700)),
  Text(task.generalInfo, style: const TextStyle(fontWeight: FontWeight.w400))
]);