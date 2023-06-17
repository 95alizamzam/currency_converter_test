import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@lazySingleton
class InternetCheckerClass {
  InternetConnectionChecker get checker => InternetConnectionChecker();
}
