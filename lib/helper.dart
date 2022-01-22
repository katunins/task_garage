import 'data/api/model/api_task_list.dart';

List<ApiTask> apiTaskListConverter (List<dynamic> map){
  List<ApiTask> result = [];
  for (var item in map) {
    print(item['id']);
    result.add(ApiTask.fromApi(item));
  }
  return result;
}