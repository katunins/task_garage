import 'package:task_garage/data/api/model/api_task_detail.dart';
import 'package:task_garage/data/api/model/api_task_list.dart';
import 'package:task_garage/data/api/model/api_user.dart';
import 'package:task_garage/domain/model/task_detail.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/model/user.dart';

class TaskDetailMapper {
  static TaskDetail fromApi(ApiTaskDetail taskDetail) {
    ApiNextTask? _nextTask = taskDetail.nextTask;
    ApiDeal? _deal = taskDetail.deal;
    ApiUser? masterName = _nextTask?.masterName;
    ApiStuckTask? stuck = _nextTask?.stuck;

    return TaskDetail(
        taskId: taskDetail.taskId,
        deal: _deal != null ? Deal(params: _deal.params, products: _deal.products) : null,
        nextTask: _nextTask != null
            ? NextTask(
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
                stuck: stuck != null
                    ? Task(
                        id: stuck.id,
                        name: stuck.name,
                        master: stuck.master,
                        templateId: stuck.templateid,
                        time: stuck.time,
                        status: stuck.status,
                        masterComment: stuck.mastercomment,
                        taskIdBefore: stuck.taskidbefore,
                        start: stuck.start,
                        end: stuck.end,
                        buffer: stuck.buffer,
                        line: stuck.line,
                        position: stuck.position,
                        generalInfo: stuck.generalinfo,
                        info: stuck.info,
                        stuck: null,
                        dealId: stuck.dealid,
                        manager: stuck.manager,
                        managerNote: stuck.managernote,
                        deal: stuck.deal,
                        createdAt: stuck.createdAt,
                        updatedAt: stuck.updatedAt)
                    : null,
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
