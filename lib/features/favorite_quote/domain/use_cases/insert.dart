import 'package:clean_artiticture_learning/features/random_quote/domain/entities/quote_entities.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/useCases/useCases.dart';
import '../repositories/fav_quote_repository.dart';

class InsertUseCase implements UseCases<void, List<String>> {
  final FavQuoteRepository favQuoteRepository;

  InsertUseCase({required this.favQuoteRepository});
  @override
  Future<Either<Failture, void>> call(List<String> params) =>
      favQuoteRepository.insertIntoDatabase(
          author: params[0],
          quote: params[1],
          type: params[2],
          time: params[3]);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
