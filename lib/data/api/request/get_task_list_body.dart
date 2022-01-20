import 'dart:convert';

import 'package:task_garage/domain/model/task_list.dart';

class GetTaskListBody {
  final TaskListRequest taskListRequest;

  GetTaskListBody({required this.taskListRequest});

  String toApi() {
    Map<String, dynamic> data = {
      'data': {'user_id': taskListRequest.userId, 'date': taskListRequest.date},
    };
    return jsonEncode(data);
  }
}
