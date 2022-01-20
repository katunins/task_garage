import 'package:task_garage/domain/model/user.dart';

abstract class TaskListRepository {
  Future<User> getTaskList({
    required Map code
  });
}