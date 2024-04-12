import 'package:dartser_client/dartser_client.dart';
import 'package:injectable/injectable.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

@module
abstract class DartSerModule {
  @lazySingleton
  Client get client => Client(
        'http://$localhost:8080/',
        authenticationKeyManager: FlutterAuthenticationKeyManager(),
      )..connectivityMonitor = FlutterConnectivityMonitor();

  @lazySingleton
  SessionManager get sessionManager {
    return SessionManager(
      caller: client.modules.auth,
    );
  }
}
