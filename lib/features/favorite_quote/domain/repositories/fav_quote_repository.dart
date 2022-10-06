import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import '../entities/favorite_quote_entity.dart';


abstract class FavQuoteRepository {
  Future<Either<Failture,List<FavQuoteEntity>>> getFromDatabase(
     );
  Future<Either<Failture, void>>  createDatabase();
  Future<Either<Failture,void > >deleteFromDatabase(int id);
  Future<Either< Failture,void> >insertIntoDatabase( {required String author,
    required String quote,
    required String time,
    required String type});
}
