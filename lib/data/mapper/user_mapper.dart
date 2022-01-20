import 'package:task_garage/data/api/model/api_user.dart';
import 'package:task_garage/domain/model/user.dart';

class UserMapper {
  static User fromApi(ApiUser user) {
    return User(
        id: user.id,
        bitrixid: user.bitrixid,
        name: user.name,
        avatar: user.avatar);
  }
}
