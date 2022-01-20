import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/state/user_provider.dart';
import 'package:task_garage/presentation/auth_page.dart';
import 'package:task_garage/presentation/main_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserProvider _userProvider =  Provider.of<UserProvider>(context);
    User? user = _userProvider.getUser;
    if (user != null) return const MainPage();
    return const AuthPage();
  }
}

