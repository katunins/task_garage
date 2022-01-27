import 'package:task_garage/domain/model/user.dart';

abstract class UserRepository {
  Future<User?> authUser({
    required String code
  });
}