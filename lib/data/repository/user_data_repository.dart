import 'package:task_garage/data/api/api_util.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/repository/user.dart';

class UserDataRepository extends UserRepository {
  final ApiUtil _apiUtil;

  UserDataRepository(this._apiUtil);

  @override
  Future<User> authUser({required String code}) {
    return _apiUtil.authUser(code: code);
  }
}
