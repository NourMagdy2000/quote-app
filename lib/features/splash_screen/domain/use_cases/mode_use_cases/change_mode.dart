import 'package:clean_artiticture_learning/features/splash_screen/domain/reprositories/mode_reprository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/useCases/useCases.dart';

class ChangeMode implements UseCases<bool, bool> {
  final ModeReprository modeReprository;

  ChangeMode({required this.modeReprository});
  @override
  Future<Either<Failture, bool>> call(bool isLight) async =>
      await modeReprository.changeMode(isLight: isLight);

  @override
  // TODO: implement props
  List<Object?> get props => [modeReprository];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();




}