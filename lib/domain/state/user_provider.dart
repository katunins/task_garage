import 'package:flutter/cupertino.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/repository/user.dart';

class UserProvider with ChangeNotifier {
  UserProvider(this._userRepository);

  final UserRepository _userRepository;

  User? _user;
  User? get user => _user;

  Future<void> getUser(String code) async {
    final User user = await _userRepository.getUser(code: code);
    _user = user;
    notifyListeners();
  }
}
