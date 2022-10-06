import 'package:equatable/equatable.dart';

abstract class Failture extends Equatable{
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failture{}

class CacheFailure extends Failture{}