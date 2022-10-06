import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/entities/quote_entities.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteReprository{


  Future<Either<Failture,QuoteEntities>>getRandomQuote();



}