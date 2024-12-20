import 'package:bookly/Features/home/data_layer/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data_layer/data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/data_layer/repository/home_repo.dart';
import 'package:bookly/core/utils/web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> getDepenency() async {
  sl.registerLazySingleton<HomeRepositoryImp>(() => HomeRepositoryImp(
      homeRemoteDataSource: HomeRemoteDataSourceImp(sl.get<WebServices>()),
      homeLocalDataSource: HomeLocalDataSourceImp()));
  sl.registerLazySingleton<WebServices>(() => WebServices(Dio()));
}
