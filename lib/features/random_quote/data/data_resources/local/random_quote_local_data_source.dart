import 'dart:convert';

import 'package:clean_artiticture_learning/core/execptions/execptions.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:clean_artiticture_learning/features/random_quote/data/models/QuoteModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/quote_entities.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        AppStrings.cacheNameString, json.encode(quote));
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(AppStrings.cacheNameString);
    if (jsonString != null) {
      return Future.value(QuoteModel.fromJson(json.decode(jsonString)));
    }
    else {throw CacheExpecton();}
  }
}
