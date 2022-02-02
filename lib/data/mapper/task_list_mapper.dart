import 'package:task_garage/data/api/model/api_task_list.dart';
import 'package:task_garage/domain/model/task_list.dart';

class TaskListMapper {
  static TaskList fromApi(ApiTaskList taskList) {
    List<Task> tasks = [];
    
    
    
    for (var item in taskList.tasks) {

      ApiStuckTask? apiStuck = item.stuck;
      
      tasks.add(Task(
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
          stuck: apiStuck != null
              ? Task(
                  id: apiStuck.id,
                  name: apiStuck.name,
                  master: apiStuck.master,
                  templateId: apiStuck.templateid,
                  time: apiStuck.time,
                  status: apiStuck.status,
                  masterComment: apiStuck.mastercomment,
                  taskIdBefore: apiStuck.taskidbefore,
                  start: apiStuck.start,
                  end: apiStuck.end,
                  buffer: apiStuck.buffer,
                  line: apiStuck.line,
                  position: apiStuck.position,
                  generalInfo: apiStuck.generalinfo,
                  info: apiStuck.info,
                  dealId: apiStuck.dealid,
                  manager: apiStuck.manager,
                  managerNote: apiStuck.managernote,
                  deal: apiStuck.deal,
                  stuck: null,
                  createdAt: apiStuck.createdAt,
                  updatedAt: apiStuck.updatedAt,
                  masterName: apiStuck.masterName)
              : null,
          createdAt: item.createdAt,
          updatedAt: item.updatedAt));
    }

    return TaskList(
        tasks: tasks,
        notFinished: NotFinished(
          deadline: taskList.notfinished.deadline,
          stuck: taskList.notfinished.stuck,
        ));
  }
}
