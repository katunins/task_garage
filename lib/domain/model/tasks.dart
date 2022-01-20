class TaskList {
  List<Task> tasks;
  NotFinished notFinished;

  TaskList({
    required this.tasks,
    required this.notFinished
  });
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
  int templateid;
  int time;
  String status;
  dynamic mastercomment;
  dynamic taskidbefore;
  DateTime start;
  DateTime end;
  int buffer;
  int line;
  int position;
  String generalinfo;
  dynamic info;
  int dealid;
  String manager;
  int managernote;
  String deal;
  DateTime createdAt;
  DateTime updatedAt;

  Task({
    required this.id,
    required this.name,
    required this.master,
    required this.templateid,
    required this.time,
    required this.status,
    required this.mastercomment,
    required this.taskidbefore,
    required this.start,
    required this.end,
    required this.buffer,
    required this.line,
    required this.position,
    required this.generalinfo,
    required this.info,
    required this.dealid,
    required this.manager,
    required this.managernote,
    required this.deal,
    required this.createdAt,
    required this.updatedAt,
  });
}

const body = {
  "tasks": [
    {
      "id": 40156,
      "name": "Обрубка блока",
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
      "generalinfo": "Фотокниги 20х20 см, 11 разворотов",
      "info": null,
      "dealid": 35835,
      "manager": "Аня Согдеева",
      "managernote": 1,
      "deal": "21 #10812",
      "created_at": "2022-01-11T08:30:07.000000Z",
      "updated_at": "2022-01-12T10:30:38.000000Z"
    },
  ],
  "notfinished": {"deadline": 4, "stuck": 0}
};
