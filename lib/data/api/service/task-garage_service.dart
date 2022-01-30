import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_garage/config.dart';
import 'package:task_garage/data/api/model/api_task_list.dart';
import 'package:task_garage/data/api/model/api_user.dart';
import 'package:task_garage/data/api/request/get_task_list_body.dart';
import 'package:task_garage/data/api/request/get_user_body.dart';
import 'package:task_garage/domain/model/task_list.dart';

class TaskGarageService {
  Future<ApiUser?> authUser(authUserBody body) async {
      final response =
          await http.post(Uri.parse('$BASE_URL/checkauth'), body: body.toApi());
      if (response.statusCode == 401) {
        throw 'Не верный пароль';
      }
      return ApiUser.fromApi(jsonDecode(response.body));
  }

  Future<ApiTaskList> getTaskList(GetTaskListBody body) async {
    final response = await http.post(Uri.parse('$BASE_URL/getcalendar'),
        headers: {"Content-Type": "application/json"}, body: body.toApi());
    if (response.statusCode != 200) {
      throw Exception('Error fetching users');
    }


    return ApiTaskList.fromApi(jsonDecode(response.body));
  }
}
