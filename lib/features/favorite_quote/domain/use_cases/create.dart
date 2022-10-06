import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/core/execptions/execptions.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/repositories/fav_quote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class CreateUseCase implements UseCases<void, NoParams> {
  final FavQuoteRepository favQuoteRepository;

  CreateUseCase({required this.favQuoteRepository});
  @override
  Future<Either<Failture, void>> call(NoParams noParams) => favQuoteRepository.createDatabase();

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
