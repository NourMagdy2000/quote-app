import 'dart:developer';

import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/core/execptions/execptions.dart';
import 'package:clean_artiticture_learning/core/network/network_info.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/data_resources/local/random_quote_local_data_source.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/data_resources/remote/random_quote_data_source.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/entities/quote_entities.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/repositories/quote_reprository.dart';
import 'package:dartz/dartz.dart';

import '../models/QuoteModel.dart';

 class QuoteReprositoryImpl extends QuoteReprository{
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteReprositoryImpl(
      {required this.networkInfo,
     required this.randomQuoteRemoteDataSource,
     required this.randomQuoteLocalDataSource});

  Future<Either<Failture, QuoteModel>> getRandomQuote() async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteDataQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteDataQuote);
        return Right(remoteDataQuote);
      } on ServerExecption {
        return left(ServerFailure());
      }}
    //  else {
    //   try {
    //     final localDataQuote =
    //         await randomQuoteLocalDataSource.getLastRandomQuote();
    //
    //     return Right(localDataQuote);
    //   } on CacheExpecton{
    //     return left(CacheFailure());
    //   }
    // }
  }

