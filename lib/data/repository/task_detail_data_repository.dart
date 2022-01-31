import 'package:task_garage/data/api/api_util.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/repository/task_detail.dart';

class TaskDetailDataRepository extends TaskDetailRepository {
  final ApiUtil _apiUtil;

  TaskDetailDataRepository(this._apiUtil);

  @override
  Future<TaskDetail?> getTaskDetail({required int taskId}) {
    return _apiUtil.getTaskDetail(taskId: taskId);
  }
}
