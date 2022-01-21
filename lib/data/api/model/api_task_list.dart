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
@JsonSerializable()
class Person {
  /// The generated code assumes these values exist in JSON.
  final String firstName, lastName;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? dateOfBirth;

  Person({required this.firstName, required this.lastName, this.dateOfBirth});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

Person q_$PersonFromJson(Map<String, dynamic> json) => Person(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
};


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

