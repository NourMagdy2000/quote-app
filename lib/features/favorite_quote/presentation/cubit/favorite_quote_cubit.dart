import 'package:bloc/bloc.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/data/models/favorite_quote.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/use_cases/delete.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/use_cases/get.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/use_cases/insert.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utiles/strings/app_strings.dart';
import '../../domain/entities/favorite_quote_entity.dart';
import '../../domain/use_cases/create.dart';

part 'favorite_quote_state.dart';

class FavoriteQuoteCubit extends Cubit<FavoriteQuoteState> {
  FavoriteQuoteCubit(
      {required this.createUseCase,
      required this.deleteUseCase,
      required this.getUseCase,
      required this.insertUseCase})
      : super(FavoriteQuoteInitial());

  final CreateUseCase createUseCase;
  final DeleteUseCase deleteUseCase;
  final GetUseCase getUseCase;
  final InsertUseCase insertUseCase;

  createDataBase() async {
    Either<Failture, void> response = await createUseCase.call(NoParams());
    emit(response.fold(
        (failure) => CreateDatabaseError(errorMsg: _mapFailure(failure)),
        (quote) => DatabaseLanchedSuccessState()));
  }

  deleteFromDataBase(int id) async {
    Either<Failture, void> response = await deleteUseCase.call(id);
    emit(response.fold((failure) => DeleteError(errorMsg: _mapFailure(failure)),
        (quote) => DeleteSuccessState()));
  }

  insertToDataBase(
      {required String author,
      required String quote,
      required String time,
      required String type}) async {
    List<String> params = [author, quote, type, time];
    Either<Failture, void> response = await insertUseCase.call(params);
    emit(response.fold((failure) => InsertError(errorMsg: _mapFailure(failure)),
        (quote) => InsertSuccessState()));
  }

  getFromDataBase() async {
    Either<Failture, List<FavQuoteEntity>> response =
        await getUseCase.call(NoParams());
    emit(response.fold((failure) => GetError(errorMsg: _mapFailure(failure)),
        (quote) => GetSuccessState(favQuotes: quote)));
  }

  String _mapFailure(Failture failture) {
    switch (failture.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return 'Unexpected Exception !';
    }
  }
}
