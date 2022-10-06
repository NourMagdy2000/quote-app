part of 'quote_cubit.dart';

@immutable
abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();
  @override
List<Object?> get props => [];}

class QuoteInitialState extends RandomQuoteState {}
class QuoteLoadingState extends RandomQuoteState {}
class QuoteLoadedState extends RandomQuoteState {
  final QuoteEntities quoteModel;
  QuoteLoadedState({required this.quoteModel});

  @override
  List<Object?> get props =>[quoteModel];
}
class QuoteErrorState extends RandomQuoteState {
  final String errorMsg;
  QuoteErrorState({required this.errorMsg});
  @override
  List<Object?> get props =>[errorMsg];

}

