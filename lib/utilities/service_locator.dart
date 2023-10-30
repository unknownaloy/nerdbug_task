import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:nerdbug_portfolio/repositories/api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// SERVICES
  locator.registerLazySingleton<ApiServices>(
    () => ApiServices(
      client: http.Client(),
    ),
  );
}
