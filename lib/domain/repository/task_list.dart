import 'package:task_garage/domain/model/task_list.dart';

abstract class TaskListRepository {
  Future<TaskList> getTaskList({required TaskListRequest taskListRequest});
}