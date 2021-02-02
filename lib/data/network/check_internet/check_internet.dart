import 'package:data_connection_checker/data_connection_checker.dart';

class CheckInternet {
  final bool _hasConnection;

  CheckInternet(this._hasConnection);

  Future<bool> isConnected() async {
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          return true;
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          return false;
          break;
        default:
          return _hasConnection;
      }
    });
  }
}
