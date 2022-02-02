import 'api_task_list.dart';

class ApiTaskDetail {
  final int taskId;
  final ApiDeal? deal;
  final ApiNextTask? nextTask;

  ApiTaskDetail.fromApi(Map<String, dynamic> map, this.taskId)
      : deal = map['deal'] != null ? ApiDeal.fromApi(map['deal']) : null,
        nextTask = map['nextTask'] != null ? ApiNextTask.fromApi(map['nextTask']) : null;
}

class ApiDeal {
  final Map<String, dynamic>? products;
  final Map<String, dynamic>? params;

  ApiDeal.fromApi(Map<String, dynamic> map)
      : products = map['products'],
        params = map['params'];
}