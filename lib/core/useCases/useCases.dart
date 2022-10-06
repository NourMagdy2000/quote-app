import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/random_quote/domain/entities/quote_entities.dart';
import '../error/failures.dart';

abstract class UseCases<Type,Params> extends Equatable{

  Future<Either<Failture,Type>>?call(Params params){}





}

class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}