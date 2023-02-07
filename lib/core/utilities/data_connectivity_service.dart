import 'dart:async';

import 'data_connection_checker.dart';

class DataConnectivityService {
  StreamController<DataConnectionStatus> connectivityStreamController =
  StreamController<DataConnectionStatus>();
  DataConnectivityService() {
    DataConnectionChecker().onStatusChange.listen((dataConnectionStatus) {
      connectivityStreamController.add(dataConnectionStatus);
    });
  }
}