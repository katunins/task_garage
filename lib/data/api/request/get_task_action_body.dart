import 'dart:convert';

import 'package:task_garage/domain/model/task_action.dart';

class GetTaskActionBody {
  final TaskActionRequest taskActionRequest;

  GetTaskActionBody({required this.taskActionRequest});

  String toApi() {
    Map<String, dynamic> data = {
      'data': {
        'action': taskActionRequest.action,
        'message': taskActionRequest.message,
        'taskId': taskActionRequest.taskId
      },
    };
    return jsonEncode(data);
  }
}
