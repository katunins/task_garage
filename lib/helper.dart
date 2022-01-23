import 'package:intl/intl.dart';

import 'data/api/model/api_task_list.dart';

List<ApiTask> apiTaskListConverter(List<dynamic> map) {
  List<ApiTask> result = [];
  for (var item in map) {
    result.add(ApiTask.fromApi(item));
  }
  return result;
}

String getStringDate(DateTime date) {
  return DateFormat("yyyy-MM-dd").format(date);
}
