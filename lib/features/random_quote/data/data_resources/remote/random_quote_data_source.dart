import 'dart:convert';

import 'package:clean_artiticture_learning/core/api/api_consumer.dart';
import 'package:clean_artiticture_learning/core/api/end_points.dart';
import 'package:clean_artiticture_learning/core/execptions/execptions.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/models/QuoteModel.dart';

import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
 ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<QuoteModel> getRandomQuote() async {


    final response = await apiConsumer
        .get(EndPoints.randomQuote,);
    return QuoteModel.fromJson(response);

  }
}
