import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/core/execptions/execptions.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/data/data_resources/fav_quote_remote_data_source.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/data/models/favorite_quote.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/entities/favorite_quote_entity.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/domain/repositories/fav_quote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class FavQuoteRepositoryImp extends FavQuoteRepository {
  @override
  final FavQuoteRemoteDataSource favQuoteRemoteDataSource;

  FavQuoteRepositoryImp({required this.favQuoteRemoteDataSource});

  @override
  Future<Either<Failture, void>> insertIntoDatabase(
      {required String author,
      required String quote,
      required String time,
      required String type}) async {
    try {
      await favQuoteRemoteDataSource.insert(
          author: author, quote: quote, type: type, time: time);
      return Right(null);
    } on ServerExecption catch (e) {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failture, void>> createDatabase() async {
    try {
      await favQuoteRemoteDataSource.createDataBase();
      return Right(null);
    } on ServerExecption catch (e) {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failture, void>> deleteFromDatabase(int id) async {
    try {
      await favQuoteRemoteDataSource.delete(id: id);
      return Right(null);
    } on ServerExecption catch (e) {
      throw Left(ServerFailure());
    }
  }

  List<FavQuoteEntity> favQuotes = [];
  @override
  Future<Either<Failture,List<FavQuoteEntity> >> getFromDatabase(
    ) async {
    try {
      await favQuoteRemoteDataSource.get().then((value) {
        value.forEach((element) {
          favQuotes.add(FavQuoteModel.fromJson(element));
        });
      });
      return Right(favQuotes);
    } on ServerExecption catch (e) {
      throw Left(ServerFailure());
    }
  }
}
