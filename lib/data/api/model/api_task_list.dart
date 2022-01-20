import 'package:task_garage/domain/model/task_list.dart';

class ApiTaskList {
  List<Task> tasks;
  NotFinished notFinished;

  ApiTaskList.fromApi(Map<String, dynamic> map)
      : tasks = map['tasks'],
        notFinished = map['notFinished'];
}

class ApiNotFinished {
  int deadLine;
  int stuck;

  ApiNotFinished.fromApi(Map<String, dynamic> map)
      : deadLine = map['deadline'],
        stuck = map['stuck'];
}

class ApiTask {
  int id;
  String name;
  int master;
  int templateId;
  int time;
  String status;
  String? masterComment;
  int? taskIdBefore;
  DateTime start;
  DateTime end;
  int buffer;
  int line;
  int position;
  String generalInfo;
  String? info;
  int dealId;
  String manager;
  int managerNote;
  String deal;
  DateTime createdAt;
  DateTime updatedAt;

  ApiTask.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        master = map['master'],
        templateId = map['templateid'],
        time = map['time'],
        status = map['status'],
        masterComment = map['mastercomment'],
        taskIdBefore = map['taskidbefore'],
        start = map['start'],
        end = map['end'],
        buffer = map['buffer'],
        line = map['line'],
        position = map['position'],
        generalInfo = map['generalinfo'],
        info = map['info'],
        dealId = map['dealid'],
        manager = map['manager'],
        managerNote = map['managernote'],
        deal = map['deal'],
        createdAt = map['created_at'],
        updatedAt = map['updated_at'];
}
