import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/features/splash_screen/data/data_resources/Lang_local_data_source.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/reprositories/lang_reprository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/execptions/execptions.dart';

class LangRepresitoryImp implements LangReprository {
  final LangLocalDataSouce langLocalDataSouce;

  LangRepresitoryImp({required this.langLocalDataSouce});
  @override
  Future<Either<Failture, bool>> changeLang({required String langCode}) async {
    try {
      final bool langChangeCheck =
          await langLocalDataSouce.changeLang(langCode: langCode);
      return Right(langChangeCheck);
    } on CacheExpecton {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failture, String?>> getSavedLang() async {
    try {
      final String? langCode = await langLocalDataSouce.getSavedLang();
      return Right(langCode);
    } on CacheExpecton {
      return left(CacheFailure());
    }
  }
}
