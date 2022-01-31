import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/helper.dart';

import 'api_task_list.dart';

class ApiTaskDetail {
  final int taskId;
  final ApiDeal deal;
  final ApiTask? nextTask;

  ApiTaskDetail.fromApi(Map<String, dynamic> map, this.taskId)
      : deal = ApiDeal.fromApi(map['deal']),
        nextTask = ApiTask.fromApi(map['nextTask']);
}

class ApiDeal {
  final Map<String, dynamic> products;
  final Map<String, dynamic> params;

  ApiDeal.fromApi(Map<String, dynamic> map)
      : products = map['products'],
        params = map['params'];
}
