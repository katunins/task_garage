import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/state/user_provider.dart';
import 'package:task_garage/presentation/auth_page.dart';
import 'package:task_garage/presentation/task_list_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserProvider _userProvider =  Provider.of<UserProvider>(context);
    User? user = _userProvider.user;
    if (user != null) return const TaskListPage();
    return const AuthPage();
  }
}

