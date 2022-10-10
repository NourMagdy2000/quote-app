import 'package:clean_artiticture_learning/core/execptions/execptions.dart';
import 'package:clean_artiticture_learning/features/favorite_quote/data/models/favorite_quote.dart';
import 'package:sqflite/sqflite.dart';

abstract class FavQuoteRemoteDataSource {
  createDataBase();
  insert(
      {required String author,
      required String quote,
      required String time,
      required String type});
  delete({required int id});
  Future get();
}

class FavQuoteRemoteDataSourceImp extends FavQuoteRemoteDataSource {
  var database;
  FavQuoteRemoteDataSourceImp();
  @override
  createDataBase() async {
    openDatabase('favorite_quote.db', version: 1,
        onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE favorites (id INTEGER PRIMARY KEY,author TEXT,quote TEXT,type TEXT,time TEXT )')
          .then((value) {})
          .catchError((error) {
        throw ServerExecption();
      });
    }, onOpen: (database) {
      print('database is opened !');
    }).then((value) {
      database = value;
    }).catchError((error) {
      throw ServerExecption();
    });
  }

  @override
  delete({required int id}) async {
    database
        .rawDelete('DELETE FROM favorites WHERE id = ?', [id]).then((value) {
      get();

      print('deleted ');
    });
  }

  @override
  insert(
      {required String author,
      required String quote,
      required String time,
      required String type}) async {
    await database.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO favorites(author,quote,type,time) VALUES("${author}","${quote}","${type}","${time}")')
            .then((value) {
          print('favorite quote is added successfully !');
          get();
        }));
  }

  @override
  Future get() async {
    final response = await database.rawQuery('Select * FROM favorites');

    return response;
  }
}
