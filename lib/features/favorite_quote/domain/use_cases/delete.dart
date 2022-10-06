import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/useCases/useCases.dart';
import '../repositories/fav_quote_repository.dart';

class DeleteUseCase implements UseCases<void, int> {
  final FavQuoteRepository favQuoteRepository;

  DeleteUseCase({required this.favQuoteRepository});
  @override
  Future<Either<Failture, void>> call(int id) => favQuoteRepository.deleteFromDatabase(id);

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
