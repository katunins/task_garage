import 'package:task_garage/data/api/model/api_task_detail.dart';
import 'package:task_garage/data/api/model/api_task_list.dart';
import 'package:task_garage/data/api/model/api_user.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/model/user.dart';

class TaskDetailMapper {
  static TaskDetail fromApi(ApiTaskDetail taskDetail) {
    ApiTask? _nextTask = taskDetail.nextTask;
    ApiUser? masterName = _nextTask?.masterName;

    return TaskDetail(
        taskId: taskDetail.taskId,
        deal: Deal(params: taskDetail.deal.params, products: taskDetail.deal.products),
        nextTask: _nextTask != null
            ? Task(
                id: _nextTask.id,
                name: _nextTask.name,
                master: _nextTask.master,
                templateId: _nextTask.templateid,
                time: _nextTask.time,
                status: _nextTask.status,
                masterComment: _nextTask.mastercomment,
                taskIdBefore: _nextTask.taskidbefore,
                start: _nextTask.start,
                end: _nextTask.end,
                buffer: _nextTask.buffer,
                line: _nextTask.line,
                position: _nextTask.position,
                generalInfo: _nextTask.generalinfo,
                info: _nextTask.info,
                dealId: _nextTask.dealid,
                manager: _nextTask.manager,
                managerNote: _nextTask.managernote,
                deal: _nextTask.deal,
                stuck: _nextTask.stuck,
                createdAt: _nextTask.createdAt,
                updatedAt: _nextTask.updatedAt,
                masterName: masterName != null
                    ? User(
                        avatar: masterName.avatar,
                        bitrixid: masterName.bitrixid,
                        name: masterName.name,
                        id: masterName.id)
                    : null,
              )
            : null);
  }
}
