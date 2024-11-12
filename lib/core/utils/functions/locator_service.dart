import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:project/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:project/Features/home/data/repos/home_repo_impl.dart';
import 'package:project/Features/home/domain/repos/home_repo.dart';
import 'package:project/core/utils/api_service.dart';

final GetIt getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>())));
}
