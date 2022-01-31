import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/user_provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider _userState = Provider.of<UserProvider>(context);
    User? _user = _userState.user;
    AppProvider _appState = Provider.of<AppProvider>(context);
    if (_user == null) return Container();
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(_user.avatar),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Center(
                  child: Text(
                _user.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ))),
          const SizedBox(
            height: 20.0,
          ),
          ListTile(
            title: const Text('Показывать выполненные задачи'),
            leading:
                Icon(_appState.showFinishedTasks ? Icons.check_box_outlined : Icons.check_box_outline_blank),
            onTap: () {
              _appState.switchShowFinishedTasks();
              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Выйти из аккаунта'),
            leading: const Icon(Icons.logout),
            onTap: () => _userState.logOut(),
          )
        ],
      ),
    );
  }
}
