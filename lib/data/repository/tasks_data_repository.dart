import 'package:task_garage/data/api/api_util.dart';
import 'package:task_garage/domain/model/task_action.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/repository/tasks.dart';

class TasksDataRepository extends TasksRepository {
  final ApiUtil _apiUtil;

  TasksDataRepository(this._apiUtil);

  @override
  Future<TaskList> getTaskList({required TaskListRequest taskListRequest}) {
    return _apiUtil.getTaskList(taskListRequest: taskListRequest);
  }

  @override
  Future<TaskDetail?> getTaskDetail({required int taskId}) {
    return _apiUtil.getTaskDetail(taskId: taskId);
  }

  @override
  Future<bool> setTasksAction({required TaskActionRequest taskActionRequest}) {
    return _apiUtil.setTaskAction(taskActionRequest: taskActionRequest);
  }
}
