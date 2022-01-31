import 'dart:convert';

class GetTaskDetailBody {
  final int taskId;

  GetTaskDetailBody({required this.taskId});

  String toApi() {
    Map<String, int> data = {
      'data': taskId,
    };
    return jsonEncode(data);
  }
}
