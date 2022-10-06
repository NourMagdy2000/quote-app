import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/reprositories/lang_reprository.dart';
import 'package:dartz/dartz.dart';

class GetLatLang implements UseCases<String?, NoParams> {
  final LangReprository langReprository;

  GetLatLang({required this.langReprository});
  @override
  Future<Either<Failture, String?>> call(NoParams) async =>
      await langReprository.getSavedLang();

  @override
  // TODO: implement props
  List<Object?> get props =>[langReprository];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
