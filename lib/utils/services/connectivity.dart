import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasConnection() async {
  final ConnectivityResult result = await Connectivity().checkConnectivity();
  return result != ConnectivityResult.none;
}
