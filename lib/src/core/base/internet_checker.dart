import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo{
  NetworkInfo();

  final InternetConnectionChecker checker = InternetConnectionChecker();

  Future<bool> get isConnected => checker.hasConnection;

  Stream<InternetConnectionStatus> getStatus() => checker.onStatusChange;
}
