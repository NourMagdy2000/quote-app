import 'package:clean_artiticture_learning/core/api/api_consumer.dart';
import 'package:clean_artiticture_learning/core/api/dio_consumer.dart';
import 'package:clean_artiticture_learning/core/network/network_info.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/data/data_resources/fav_quote_remote_data_source.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/data/repositories/fav_quote_reprisotory_imp.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/repositories/fav_quote_repository.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/use_cases/create.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/use_cases/delete.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/use_cases/get.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/use_cases/insert.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/presentation/cubit/favorite_quote_cubit.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/data_resources/local/random_quote_local_data_source.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/data_resources/remote/random_quote_data_source.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/repositories/quote_reprository_impl.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/repositories/quote_reprository.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:clean_artiticture_learning/features/random_quote/presentiation/cubit/quote_cubit.dart';
import 'package:clean_artiticture_learning/features/splash_screen/data/data_resources/Lang_local_data_source.dart';
import 'package:clean_artiticture_learning/features/splash_screen/data/data_resources/mode_data_source.dart';
import 'package:clean_artiticture_learning/features/splash_screen/data/reprositories/lang_reprositories_imp.dart';
import 'package:clean_artiticture_learning/features/splash_screen/data/reprositories/mode_reprository_imp.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/reprositories/lang_reprository.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/reprositories/mode_reprository.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/use_cases/localization_use_cases/change_lang.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/use_cases/localization_use_cases/get_lang.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/use_cases/mode_use_cases/get_mode.dart';
import 'package:clean_artiticture_learning/features/splash_screen/presentation/cubit/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../../core/api/interceptors.dart';
import '../splash_screen/domain/use_cases/mode_use_cases/change_mode.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => QuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory(() => LocaleCubit(
      getLatLang: sl(), changeLang: sl(), changeMode: sl(), getLatMode: sl()));
  /// fav cubit////////
  sl.registerFactory(() => FavoriteQuoteCubit(
      createUseCase: sl(),
      deleteUseCase: sl(),
      getUseCase: sl(),
      insertUseCase: sl()));
  // use cases//
  sl.registerLazySingleton(() => GetRandomQuote(quoteReprository: sl()));
  sl.registerLazySingleton(() => GetLatLang(langReprository: sl()));
  sl.registerLazySingleton(() => ChangeLang(langReprository: sl()));
  sl.registerLazySingleton(() => GetLatMode(modeReprository: sl()));
  sl.registerLazySingleton(() => ChangeMode(modeReprository: sl()));
sl.registerLazySingleton(() => GetUseCase(favQuoteRepository: sl()));
  sl.registerLazySingleton(() => CreateUseCase(favQuoteRepository: sl()));
  sl.registerLazySingleton(() => DeleteUseCase(favQuoteRepository: sl()));
  sl.registerLazySingleton(() => InsertUseCase(favQuoteRepository: sl()));

  // reprositpory//
  sl.registerLazySingleton<QuoteReprository>(() => QuoteReprositoryImpl(
      randomQuoteRemoteDataSource: sl(),
      networkInfo: sl(),
      randomQuoteLocalDataSource: sl()));
  sl.registerLazySingleton<LangReprository>(
      () => LangRepresitoryImp(langLocalDataSouce: sl()));
  sl.registerLazySingleton<ModeReprository>(
      () => ModeRepresitoryImp(modeLocalDataSouce: sl()));
  sl.registerLazySingleton<FavQuoteRepository>(
          () => FavQuoteRepositoryImp(favQuoteRemoteDataSource: sl()));
  // data sources //
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<LangLocalDataSouce>(
      () => LangLocalDataSouceImp(sharedPreferences: sl()));
  sl.registerLazySingleton<ModeLocalDataSouce>(
      () => ModeLocalDataSouceImp(sharedPreferences: sl()));
  sl.registerLazySingleton<FavQuoteRemoteDataSource>(
          () => FavQuoteRemoteDataSourceImp());
  //core////
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkCheck(internetConnectionChecker: sl()));

  //shared//

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestHeader: true,
      responseBody: true,
      error: true,
      requestBody: true,
      responseHeader: true));
  sl.registerLazySingleton(() => Dio());

}
