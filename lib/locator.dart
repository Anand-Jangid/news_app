import 'package:get_it/get_it.dart';
import 'package:news_app/Connectivity/internet_connectivity.dart';
import 'package:news_app/Database/database_helper.dart';
import 'package:news_app/Networking/news_api.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<NewsAPI>(() => NewsAPI());
  locator.registerLazySingleton<InternetConnectivity>(
      () => InternetConnectivity());
}
