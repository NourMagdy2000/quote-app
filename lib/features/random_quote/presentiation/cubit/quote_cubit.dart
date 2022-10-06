import 'package:bloc/bloc.dart';
import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/entities/quote_entities.dart';
import 'package:clean_artiticture_learning/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/QuoteModel.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;

  QuoteCubit({required this.getRandomQuoteUseCase})
      : super(QuoteInitialState());

  Future<void> getRandomQuote() async {
    emit(QuoteLoadingState());
    Either<Failture, QuoteEntities> response =
        await getRandomQuoteUseCase(NoParams());
    emit(response.fold(
        (failure) => QuoteErrorState(errorMsg: _mapFailure(failure)),
        (quote) => QuoteLoadedState(quoteModel: quote)));
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
