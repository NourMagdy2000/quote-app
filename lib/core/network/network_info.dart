import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/random_quote/domain/entities/quote_entities.dart';

abstract class NetworkInfo{

Future<bool> get isConnected;

}
class NetworkCheck implements NetworkInfo{
  final InternetConnectionChecker internetConnectionChecker;

  NetworkCheck({required this.internetConnectionChecker});
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected async=>await internetConnectionChecker.hasConnection;







}