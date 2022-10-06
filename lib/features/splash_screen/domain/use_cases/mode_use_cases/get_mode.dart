import 'package:clean_artiticture_learning/features/splash_screen/domain/reprositories/mode_reprository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/useCases/useCases.dart';

class GetLatMode implements UseCases<bool?, NoParams> {
  final ModeReprository modeReprository;

  GetLatMode({required this.modeReprository});
  @override
  Future<Either<Failture, bool?>> call(NoParams params) async =>
      await modeReprository.getSavedMode();

  @override
  // TODO: implement props
  List<Object?> get props =>[modeReprository];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
