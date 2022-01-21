import 'package:task_garage/domain/model/task_list.dart';

class ApiTaskList {
  final List<Task> tasks;
  final ApiNotFinished notfinished;

  ApiTaskList.fromApi(Map<String, dynamic> map)
      : tasks = map['tasks'].map((item)=>ApiTask.fromApi(item)),
        notfinished = ApiNotFinished.fromApi(map['notfinished']);
      // : tasks = map['tasks'],
      //   notfinished = map['notfinished'];

}

class ApiTask {
  int id;
  String name;
  int master;
  int templateid;
  int time;
  String status;
  dynamic mastercomment;
  int taskidbefore;
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
  DateTime created_at;
  DateTime updated_at;

  ApiTask.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        master = map['master'],
        templateid = map['templateid'],
        time = map['time'],
        status = map['status'],
        mastercomment = map['mastercomment'],
        taskidbefore = map['taskidbefore'],
        start = map['start'],
        end = map['end'],
        buffer = map['buffer'],
        line = map['line'],
        position = map['position'],
        generalinfo = map['generalinfo'],
        info = map['info'],
        dealid = map['dealid'],
        manager = map['manager'],
        managernote = map['managernote'],
        deal = map['deal'],
        created_at = map['created_at'],
        updated_at = map['updated_at'];
}
class ApiNotFinished {
  int deadline;
  int stuck;

  ApiNotFinished.fromApi(Map<String, dynamic> map)
      : deadline = map['deadline'],
        stuck = map['stuck'];
}

