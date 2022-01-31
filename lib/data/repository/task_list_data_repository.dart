import 'package:task_garage/data/api/api_util.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/repository/task_list.dart';

class TaskListDataRepository extends TaskListRepository {
  final ApiUtil _apiUtil;

  TaskListDataRepository(this._apiUtil);

  @override
  Future<TaskList> getTaskList({required TaskListRequest taskListRequest}) {
    return _apiUtil.getTaskList(taskListRequest: taskListRequest);
  }
}
