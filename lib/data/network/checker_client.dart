import 'package:data_connection_checker/data_connection_checker.dart';

class CheckerClient {
  // Get:-----------------------------------------------------------------------
  Future<bool> isConnected() async {
    // actively listen for status updates
    bool internetStatus = false;
    var listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          internetStatus = true;
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          internetStatus = false;
          break;
      }
    });

    // close listener after 3 seconds, so the program doesn't run forever
    await Future.delayed(Duration(seconds: 3));
    await listener.cancel();
    return internetStatus;
  }
}
