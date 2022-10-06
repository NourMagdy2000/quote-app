import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class LangReprository{

Future<Either<Failture,String?>> getSavedLang ();
Future<Either<Failture,bool>> changeLang ({required String langCode});


}