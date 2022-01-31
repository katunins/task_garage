import 'package:task_garage/data/repository/tasks_data_repository.dart';
import 'package:task_garage/data/repository/user_data_repository.dart';
import 'package:task_garage/domain/repository/tasks.dart';
import 'package:task_garage/domain/repository/user.dart';

import 'api_module.dart';

class RepositoryModule {
  static UserRepository _userRepository = UserDataRepository(
    ApiModule.apiUtil(),
  );

  static TasksRepository _taskListRepository =
      TasksDataRepository(ApiModule.apiUtil());

  static TasksRepository _taskDetailRepository =
      TasksDataRepository(ApiModule.apiUtil());

  static TasksRepository _setTasksRepository =
      TasksDataRepository(ApiModule.apiUtil());

  static UserRepository userRepository() {
    if (_userRepository == null) {
      _userRepository = UserDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _userRepository;
  }

  static TasksRepository taskListRepository() {
    if (_taskListRepository == null) {
      _taskListRepository = TasksDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _taskListRepository;
  }

  static TasksRepository taskDetailRepository() {
    if (_taskDetailRepository == null) {
      _taskDetailRepository = TasksDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _taskDetailRepository;
  }

  static TasksRepository setTasksRepository() {
    if (_setTasksRepository == null) {
      _setTasksRepository = TasksDataRepository(ApiModule.apiUtil());
    }
    return _setTasksRepository;
  }
}
