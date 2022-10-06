import 'package:clean_artiticture_learning/core/error/failures.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/reprositories/lang_reprository.dart';
import 'package:dartz/dartz.dart';

class ChangeLang implements UseCases<bool, String> {
  final LangReprository langReprository;

  ChangeLang({required this.langReprository});
  @override
  Future<Either<Failture, bool>> call(String langCode) async =>
      await langReprository.changeLang(langCode: langCode);

  @override
  // TODO: implement props
  List<Object?> get props => [langReprository];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();




}
