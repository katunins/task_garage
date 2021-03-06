import 'package:task_garage/domain/model/user.dart';

class TaskListRequest {
  int userId;
  DateTime date;

  TaskListRequest({required this.date, required this.userId});
}

class TaskList {
  List<Task> tasks;
  NotFinished notFinished;

  TaskList({required this.tasks, required this.notFinished});
}

class NotFinished {
  int deadline;
  int stuck;

  NotFinished({
    required this.deadline,
    required this.stuck,
  });
}

class Task {
  int id;
  String name;
  int master;
  int? templateId;
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
  int? managerNote;
  String deal;
  Task? stuck;
  DateTime createdAt;
  DateTime updatedAt;
  String? masterName;

  Task(
      {required this.id,
      required this.name,
      required this.master,
      required this.templateId,
      required this.time,
      required this.status,
      required this.masterComment,
      required this.taskIdBefore,
      required this.start,
      required this.end,
      required this.buffer,
      required this.line,
      required this.position,
      required this.generalInfo,
      required this.info,
      required this.stuck,
      required this.dealId,
      required this.manager,
      required this.managerNote,
      required this.deal,
      required this.createdAt,
      required this.updatedAt,
      this.masterName});
}

class NextTask {
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
  int? managerNote;
  String deal;
  Task? stuck;
  DateTime createdAt;
  DateTime updatedAt;
  User? masterName;

  NextTask(
      {required this.id,
      required this.name,
      required this.master,
      required this.templateId,
      required this.time,
      required this.status,
      required this.masterComment,
      required this.taskIdBefore,
      required this.start,
      required this.end,
      required this.buffer,
      required this.line,
      required this.position,
      required this.generalInfo,
      required this.info,
      required this.stuck,
      required this.dealId,
      required this.manager,
      required this.managerNote,
      required this.deal,
      required this.createdAt,
      required this.updatedAt,
      this.masterName});
}

const body = {
  "tasks": [
    {
      "id": 40156,
      "name": "?????????????? ??????????",
      "master": 2,
      "templateid": 11,
      "time": 6,
      "status": "finished",
      "mastercomment": null,
      "taskidbefore": 40153,
      "start": "2022-01-13 10:00:00",
      "end": "2022-01-13 10:06:00",
      "buffer": 90,
      "line": 1,
      "position": 6,
      "generalinfo": "?????????????????? 20??20 ????, 11 ????????????????????",
      "info": null,
      "dealid": 35835,
      "manager": "?????? ????????????????",
      "managernote": 1,
      "deal": "21 #10812",
      "created_at": "2022-01-11T08:30:07.000000Z",
      "updated_at": "2022-01-12T10:30:38.000000Z"
    },
  ],
  "notfinished": {"deadline": 4, "stuck": 0}
};
