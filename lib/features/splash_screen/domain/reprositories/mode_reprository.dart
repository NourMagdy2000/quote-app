import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ModeReprository{

  Future<Either<Failture,bool?>> getSavedMode ();
  Future<Either<Failture,bool>> changeMode ({required bool isLight});


}