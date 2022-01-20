import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/domain/state/user_provider.dart';
import 'package:task_garage/presentation/home.dart';

import 'dependencies/repository_module.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        // home: const Home(),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
                value: UserProvider(
              RepositoryModule.userRepository(),
            )),
            ChangeNotifierProvider.value(
                value: TaskListProvider(RepositoryModule.taskListRepository()))
          ],
          child: const Home(),
        ));
  }
}
