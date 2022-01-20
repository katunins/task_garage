import 'package:task_garage/data/api/api_util.dart';
import 'package:task_garage/data/api/service/task-garage_service.dart';

class ApiModule {
  static ApiUtil _apiUtil=ApiUtil(TaskGarageService());

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(TaskGarageService());
    }
    return _apiUtil;
  }
}