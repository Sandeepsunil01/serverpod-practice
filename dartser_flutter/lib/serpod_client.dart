import 'package:dartser_client/dartser_client.dart';
import 'package:injectable/injectable.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

@module
abstract class DartSerModule {
  Client get client => Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
}
