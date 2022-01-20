import 'package:task_garage/data/repository/user_data_repository.dart';
import 'package:task_garage/domain/repository/user.dart';

import 'api_module.dart';

class RepositoryModule {
  static UserRepository _userRepository = UserDataRepository(
    ApiModule.apiUtil(),
  );

  static UserRepository userRepository() {
    if (_userRepository == null) {
      _userRepository = UserDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _userRepository;
  }
}
