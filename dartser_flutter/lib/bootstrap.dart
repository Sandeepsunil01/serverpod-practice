import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartser_flutter/dependency_injections.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // var client = Client('http://$localhost:8080/')
  //   ..connectivityMonitor = FlutterConnectivityMonitor();

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  configureDependencies();
  runApp(await builder());
}
