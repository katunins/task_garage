import 'package:task_garage/domain/model/task_detail.dart';

abstract class TaskDetailRepository {
  Future<TaskDetail?> getTaskDetail({
    required int taskId
  });
}