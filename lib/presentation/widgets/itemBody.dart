import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/presentation/widgets/stuckBadge.dart';

import '../../config.dart';
import '../../helper.dart';
import 'dealBadge.dart';
import 'infoBadge.dart';
import 'lightBadge.dart';

class TaskWidget {
  final String name;
  final String status;
  final DateTime start;
  final DateTime end;
  final String generalInfo;
  final String? info;
  final String deal;
  final Task? stuck;
  final int? managerNote;
  bool? mini;

  TaskWidget(
      {required this.name,
      required this.status,
      required this.start,
      required this.end,
      required this.generalInfo,
      this.info,
      required this.deal,
      this.stuck,
      this.mini = false,
        this.managerNote
      });

  Widget getItem() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            DealNameBadge(text: deal, isActive: status != 'finished', mini: mini),
            if ((info != null || managerNote != null)&& mini == false) const InfoBadge(),
            if (stuck != null && mini == false) const StuckBadge(),
            Expanded(child: Container()),
            LightBadge(text: getTimeFromDateTime(start), mini: mini),
            LightBadge(text: getDifferenceInTime(start, end), mini: mini),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: mini! ? fontSizes.mini : null)),
        Text(generalInfo, style: TextStyle(fontWeight: FontWeight.w400, fontSize: mini! ? fontSizes.mini : null))
      ]);
}
