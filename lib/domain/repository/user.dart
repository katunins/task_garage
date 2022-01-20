import 'package:task_garage/domain/model/user.dart';

abstract class UserRepository {
  Future<User> getUser({
    required String code
  });
}