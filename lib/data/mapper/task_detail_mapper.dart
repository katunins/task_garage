import 'package:task_garage/data/api/model/api_task_detail.dart';
import 'package:task_garage/data/api/model/api_user.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/model/user.dart';

class TaskDetailMapper {
  static TaskDetail fromApi(ApiTaskDetail taskDetail) {
    ApiUser? masterName = taskDetail.nextTask.masterName;
    return TaskDetail(
          taskId: taskDetail.taskId,
        deal: Deal(params: taskDetail.deal.params, products: taskDetail.deal.products),
        nextTask: Task(
          id: taskDetail.nextTask.id,
          name: taskDetail.nextTask.name,
          master: taskDetail.nextTask.master,
          templateId: taskDetail.nextTask.templateid,
          time: taskDetail.nextTask.time,
          status: taskDetail.nextTask.status,
          masterComment: taskDetail.nextTask.mastercomment,
          taskIdBefore: taskDetail.nextTask.taskidbefore,
          start: taskDetail.nextTask.start,
          end: taskDetail.nextTask.end,
          buffer: taskDetail.nextTask.buffer,
          line: taskDetail.nextTask.line,
          position: taskDetail.nextTask.position,
          generalInfo: taskDetail.nextTask.generalinfo,
          info: taskDetail.nextTask.info,
          dealId: taskDetail.nextTask.dealid,
          manager: taskDetail.nextTask.manager,
          managerNote: taskDetail.nextTask.managernote,
          deal: taskDetail.nextTask.deal,
          stuck: taskDetail.nextTask.stuck,
          createdAt: taskDetail.nextTask.createdAt,
          updatedAt: taskDetail.nextTask.updatedAt,
          masterName: masterName != null
              ? User(
                  avatar: masterName.avatar,
                  bitrixid: masterName.bitrixid,
                  name: masterName.name,
                  id: masterName.id)
              : null,
        ));
  }
}
