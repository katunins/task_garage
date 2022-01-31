import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/state/app_provider.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider _appState = Provider.of<AppProvider>(context);
    if (!_appState.loader) return Container();
    return const SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2.0,
        ));
  }
}
