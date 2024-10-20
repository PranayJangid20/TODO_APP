import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.I;
Future setupLocator() async {
  locator.registerSingletonAsync(() async => await SharedPreferences.getInstance());
}