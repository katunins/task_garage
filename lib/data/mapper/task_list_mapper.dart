import 'package:task_garage/data/api/model/api_task_list.dart';
import 'package:task_garage/domain/model/task_list.dart';

class TaskListMapper {
  static TaskList fromApi(ApiTaskList taskList) {
    return TaskList(tasks: taskList.tasks, notfinished: NotFinished(deadline: 0, stuck: 0));
  }
}