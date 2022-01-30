import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/state/loader_provider.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoaderProvider _loaderState = Provider.of<LoaderProvider>(context);
    if (!_loaderState.loader) return Container();
    return const SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2.0,
        ));
  }
}
