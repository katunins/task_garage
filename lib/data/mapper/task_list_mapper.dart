import 'package:task_garage/data/api/model/api_task_list.dart';
import 'package:task_garage/domain/model/task_list.dart';

class TaskListMapper {
  static TaskList fromApi(ApiTaskList taskList) {
    List<Task> tasks = [];
    for (var item in taskList.tasks) {
      tasks.add(
          Task(
              id: item.id,
              name: item.name,
              master: item.master,
              templateId: item.templateid,
              time: item.time,
              status: item.status,
              masterComment: item.mastercomment,
              taskIdBefore: item.taskidbefore,
              start: item.start,
              end: item.end,
              buffer: item.buffer,
              line: item.line,
              position: item.position,
              generalInfo: item.generalinfo,
              info: item.info,
              dealId: item.dealid,
              manager: item.manager,
              managerNote: item.managernote,
              deal: item.deal,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt)
      );
    }

    return TaskList(
        tasks: tasks,
        notFinished: NotFinished(
          deadline: taskList.notfinished.deadline,
          stuck: taskList.notfinished.stuck,
        ));
  }
}
