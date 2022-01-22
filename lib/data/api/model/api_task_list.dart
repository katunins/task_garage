import 'package:task_garage/helper.dart';

class ApiTaskList {
  final List<ApiTask> tasks;
  final ApiNotFinished notfinished;

  ApiTaskList.fromApi(Map<String, dynamic> map)
      : tasks = apiTaskListConverter(map['tasks']),
        notfinished = ApiNotFinished.fromApi(map['notfinished']);
}

class ApiNotFinished {
  final int deadline;
  final int stuck;

  ApiNotFinished.fromApi(Map<String, dynamic> map)
      : deadline = map['deadline'],
        stuck = map['stuck'];
}

class ApiTask {
  final int id;
  final String name;
  final int master;
  final int templateid;
  final int time;
  final String status;
  final String? mastercomment;
  final int? taskidbefore;
  final DateTime start;
  final DateTime end;
  final int buffer;
  final int line;
  final int position;
  final String generalinfo;
  final String? info;
  final int dealid;
  final String manager;
  final int? managernote;
  final String deal;
  final DateTime createdAt;
  final DateTime updatedAt;

  ApiTask.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        master = map['master'],
        templateid = map['templateid'],
        time = map['time'],
        status = map['status'],
        mastercomment = map['mastercomment'],
        taskidbefore = map['taskidbefore'],
        start = DateTime.parse(map['start']),
        end = DateTime.parse(map['end']),
        buffer = map['buffer'],
        line = map['line'],
        position = map['position'],
        generalinfo = map['generalinfo'],
        info = map['info'],
        dealid = map['dealid'],
        manager = map['manager'],
        managernote = map['managernote'],
        deal = map['deal'],
        createdAt = DateTime.parse(map['created_at']),
        updatedAt = DateTime.parse(map['updated_at']);
}
