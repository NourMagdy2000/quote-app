import 'package:clean_artiticture_learning/features/splash_screen/data/data_resources/mode_data_source.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/reprositories/mode_reprository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/execptions/execptions.dart';

class ModeRepresitoryImp implements ModeReprository {
  final ModeLocalDataSouce modeLocalDataSouce;

  ModeRepresitoryImp({required this.modeLocalDataSouce});
  @override
  Future<Either<Failture, bool>> changeMode({required bool isLight}) async {
    try {
      final bool modeChangeCheck =
      await modeLocalDataSouce.changeMode(isLight: isLight);
      return Right(modeChangeCheck);
    } on CacheExpecton {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failture, bool?>> getSavedMode() async {
    try {
      final bool? isLight = await modeLocalDataSouce.getSavedMode();
      return Right(isLight);
    } on CacheExpecton {
      return left(CacheFailure());
    }
  }


  }
