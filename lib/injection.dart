import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:isar_flutter/data/data_source/local/isar_config.dart';
import 'package:isar_flutter/data/data_source/local/quotes_local_data_source.dart';
import 'package:isar_flutter/data/data_source/remote/quotes_remote_data_source.dart';
import 'package:isar_flutter/data/repository/internet_connectivity_repository_impl.dart';
import 'package:isar_flutter/data/repository/quotes_repository_impl.dart';
import 'package:isar_flutter/domain/repository/internet_connection_repository.dart';
import 'package:isar_flutter/domain/repository/quotes_repository.dart';
import 'package:isar_flutter/domain/usecase/deleted_quotes_usecase.dart';
import 'package:isar_flutter/domain/usecase/get_quotes_usecase.dart';
import 'package:isar_flutter/domain/usecase/get_save_quotes_usecase.dart';
import 'package:isar_flutter/domain/usecase/internet_connectivity_usecase.dart';
import 'package:isar_flutter/domain/usecase/save_quotes_usecase.dart';

final locator = GetIt.instance;

void initInjection() {
  //http client
  locator.registerLazySingleton(() => Client());

  //isar config
  locator.registerLazySingleton(() => IsarConfig());

  //remote data source
  locator.registerSingleton<IQuotesRemoteDataSource>(
    QuotesRemoteDataSource(httpClient: locator.get()),
  );

  //local data source
  locator.registerSingleton<IQuotesLocalDataSource>(
      QuotesLocalDataSource(isarConfig: locator.get()));

  //repository
  locator.registerSingleton<IQuotesRepository>(
    QuotesRepositoryImpl(
      remoteDataSource: locator.get(),
      localDataSource: locator.get(),
    ),
  );

  locator.registerSingleton<IInternetConnectionRepository>(
    InternetConnectionRepositoryImpl(),
  );

  //usecase
  locator.registerFactory(() => GetQuotesUsecase(repository: locator.get()));

  locator.registerFactory(() => SaveQuotesUsecase(repository: locator.get()));

  locator.registerFactory(
    () => GetSaveQuotesUsecase(repository: locator.get()),
  );

  locator.registerFactory(
    () => DeletedQuotesUsecase(repository: locator.get()),
  );

  locator.registerFactory(
    () => InternetConnectivityUsecase(repository: locator.get()),
  );
}
