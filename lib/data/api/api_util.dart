import 'package:task_garage/data/api/request/get_task_list_body.dart';
import 'package:task_garage/data/api/request/get_user_body.dart';
import 'package:task_garage/data/api/service/task-garage_service.dart';
import 'package:task_garage/data/mapper/task_list_mapper.dart';
import 'package:task_garage/data/mapper/user_mapper.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/model/user.dart';

class ApiUtil {
  final TaskGarageService _taskGarageService;

  ApiUtil(this._taskGarageService);

  Future<User> getUser({
    required String code
  }) async {
    final body = GetUserBody(code: code);
    final result = await _taskGarageService.getUser(body);
    return UserMapper.fromApi(result);
  }

  Future<TaskList> getTaskList({
    required TaskListRequest taskListRequest
  }) async {
    final body = GetTaskListBody(taskListRequest: taskListRequest);
    final result = await _taskGarageService.getTaskList(body);
    return TaskListMapper.fromApi(result);
  }
}