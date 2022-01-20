import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_garage/config.dart';
import 'package:task_garage/data/api/model/api_user.dart';
import 'package:task_garage/data/api/request/get_user_body.dart';

class TaskGarageService {
  Future<ApiUser> getUser(GetUserBody body) async {
    final response =
        await http.post(Uri.parse('$BASE_URL/checkauth'), body: body.toApi());
    if (response.statusCode != 200) {
      throw Exception('Error fetching users');
    }

    return ApiUser.fromApi(jsonDecode(response.body));
  }
}
