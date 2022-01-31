import 'package:task_garage/domain/model/task_action.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';

abstract class TasksRepository {
  Future<TaskList> getTaskList({required TaskListRequest taskListRequest});
  Future<TaskDetail?> getTaskDetail({required int taskId});
  Future<bool> setTasksAction({required TaskActionRequest taskActionRequest});
}