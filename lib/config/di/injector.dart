import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:raintor_test/config/network/api_urls.dart';
import 'package:raintor_test/features/event_feed/data/data_source/event_feed_remote_data_source.dart';
import 'package:raintor_test/features/event_feed/data/repository/event_feed_repository_imp.dart';
import 'package:raintor_test/features/event_feed/domain/repository/event_feed_repository.dart';
import 'package:raintor_test/features/event_feed/domain/use_case/event_usecase.dart';
import 'package:raintor_test/features/location/data/data_source/location_remote_data_source.dart';
import 'package:raintor_test/features/location/data/repository/location_repository_imp.dart';
import 'package:raintor_test/features/location/domain/repository/location_repository.dart';
import 'package:raintor_test/features/location/domain/use_case/location_usecase.dart';
import 'package:raintor_test/flavor/app_setting.dart';
import 'package:signalr_core/signalr_core.dart';

final getIt = GetIt.instance;

void setupDependencies({AppState appState = AppState.development}) {
  getIt
    ..registerSingleton<AppState>(appState)
    ..registerLazySingleton<Logger>(
      () => Logger(
        printer: PrettyPrinter(),
      ),
    )
    ..registerLazySingleton<HubConnection>(
      () => HubConnectionBuilder()
          .withUrl(
            ApiUrls.hubConnection,
          )
          .build(),
    )
    ..registerLazySingleton<Dio>(
      ()=>Dio(
        BaseOptions(
          responseType: ResponseType.plain,
        ),
      ),
    )
    ..registerLazySingleton<LocationRemoteDataSource>(
      LocationRemoteDataSource.new,
    )
    ..registerLazySingleton<EventFeedRemoteDataSource>(
      EventFeedRemoteDataSource.new,
    )
    ..registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImp(getIt<LocationRemoteDataSource>()),
    )
    ..registerLazySingleton<EventFeedRepository>(
      () => EventFeedRepositoryImp(getIt<EventFeedRemoteDataSource>()),
    )
    ..registerLazySingleton<LocationUseCase>(
      () => LocationUseCase(getIt<LocationRepository>()),
    )
    ..registerLazySingleton<EventUsecase>(
      () => EventUsecase(getIt<EventFeedRepository>()),
    );
}
