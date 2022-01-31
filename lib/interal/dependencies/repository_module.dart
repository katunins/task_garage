import 'package:task_garage/data/repository/task_detail_data_repository.dart';
import 'package:task_garage/data/repository/task_list_data_repository.dart';
import 'package:task_garage/data/repository/user_data_repository.dart';
import 'package:task_garage/domain/repository/task_detail.dart';
import 'package:task_garage/domain/repository/task_list.dart';
import 'package:task_garage/domain/repository/user.dart';

import 'api_module.dart';

class RepositoryModule {
  static UserRepository _userRepository = UserDataRepository(
    ApiModule.apiUtil(),
  );

  static TaskListRepository _taskListRepository = TaskListDataRepository(ApiModule.apiUtil());

  static TaskDetailRepository _taskDetailRepository = TaskDetailDataRepository(ApiModule.apiUtil());

  static UserRepository userRepository() {
    if (_userRepository == null) {
      _userRepository = UserDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _userRepository;
  }

  static TaskListRepository taskListRepository() {
    if (_taskListRepository == null) {
      _taskListRepository = TaskListDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _taskListRepository;
  }

  static TaskDetailRepository taskDetailRepository() {
    if (_taskDetailRepository == null) {
      _taskDetailRepository = TaskDetailDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _taskDetailRepository;
  }
}
