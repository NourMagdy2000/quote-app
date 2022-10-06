part of 'favorite_quote_cubit.dart';

@immutable
abstract class FavoriteQuoteState {}

class FavoriteQuoteInitial extends FavoriteQuoteState {}

class DatabaseLanchedSuccessState extends FavoriteQuoteState {}

class CreateDatabaseError extends FavoriteQuoteState {
  final String errorMsg;

  CreateDatabaseError({required this.errorMsg});
}

class InsertSuccessState extends FavoriteQuoteState {}

class InsertError extends FavoriteQuoteState {
  final String errorMsg;

  InsertError({required this.errorMsg});
}

class GetSuccessState extends FavoriteQuoteState {
  final List<FavQuoteEntity> favQuotes;

  GetSuccessState({required this.favQuotes});
}

class GetError extends FavoriteQuoteState {
  final String errorMsg;

  GetError({required this.errorMsg});
}

class DeleteSuccessState extends FavoriteQuoteState {}

class DeleteError extends FavoriteQuoteState {
  final String errorMsg;

  DeleteError({required this.errorMsg});
}
