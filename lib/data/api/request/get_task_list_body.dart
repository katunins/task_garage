import 'dart:convert';

import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/helper.dart';

class GetTaskListBody {
  final TaskListRequest taskListRequest;

  GetTaskListBody({required this.taskListRequest});

  String toApi() {
    Map<String, dynamic> data = {
      'data': {
        'user_id': taskListRequest.userId,
        'date': getStringDate(date: taskListRequest.date, forServer: true)
      },
    };
    return jsonEncode(data);
  }
}
