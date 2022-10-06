import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/core/execptions/execptions.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/repositories/fav_quote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import '../entities/favorite_quote_entity.dart';

class GetUseCase implements UseCases<  List<FavQuoteEntity> , NoParams> {
  final FavQuoteRepository favQuoteRepository;

  GetUseCase({required this.favQuoteRepository});
  @override
  Future<Either<Failture,   List<FavQuoteEntity> >>call(NoParams noParams) =>
      favQuoteRepository.getFromDatabase();

  @override
  // TODO: implement props
  List<Object?> get props => [favQuoteRepository];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
