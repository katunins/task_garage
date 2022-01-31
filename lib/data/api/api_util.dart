import 'package:task_garage/data/api/request/get_task_action_body.dart';
import 'package:task_garage/data/api/request/get_task_detail_body.dart';
import 'package:task_garage/data/api/request/get_task_list_body.dart';
import 'package:task_garage/data/api/request/get_user_body.dart';
import 'package:task_garage/data/api/service/task-garage_service.dart';
import 'package:task_garage/data/mapper/task_detail_mapper.dart';
import 'package:task_garage/data/mapper/task_list_mapper.dart';
import 'package:task_garage/data/mapper/user_mapper.dart';
import 'package:task_garage/domain/model/task_action.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/model/user.dart';

class ApiUtil {
  final TaskGarageService _taskGarageService;

  ApiUtil(this._taskGarageService);

  Future<User?> authUser({required String code}) async {
    final body = authUserBody(code: code);
    final result = await _taskGarageService.authUser(body);
    if (result != null) return UserMapper.fromApi(result);
  }

  Future<TaskList> getTaskList(
      {required TaskListRequest taskListRequest}) async {
    final body = GetTaskListBody(taskListRequest: taskListRequest);
    final result = await _taskGarageService.getTaskList(body);
    return TaskListMapper.fromApi(result);
  }

  Future<TaskDetail> getTaskDetail({required int taskId}) async {
    final body = GetTaskDetailBody(taskId: taskId);
    final result = await _taskGarageService.getTaskDetail(body, taskId);
    return TaskDetailMapper.fromApi(result);
  }

  Future<bool> setTaskAction(
      {required TaskActionRequest taskActionRequest}) async {
    final body = GetTaskActionBody(taskActionRequest: taskActionRequest);
    final result = await _taskGarageService.setTaskAction(body);
    return result;
  }
}
