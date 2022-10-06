import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/entities/quote_entities.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/repositories/quote_reprository.dart';
import 'package:dartz/dartz.dart';

class GetRandomQuote implements UseCases<QuoteEntities,NoParams>{

final QuoteReprository quoteReprository;

  GetRandomQuote({required this.quoteReprository});
  @override
  Future<Either<Failture, QuoteEntities>> call(NoParams params) =>quoteReprository.getRandomQuote();






  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();



}