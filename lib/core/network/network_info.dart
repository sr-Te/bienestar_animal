import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  Future<bool> isConnected() async {
    final connection = await Connectivity().checkConnectivity();
    return connection == ConnectivityResult.ethernet ||
        connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi;
  }
}
