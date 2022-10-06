part of 'splash_cubit.dart';

@immutable
abstract class LocaleState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class changeLocalState extends LocaleState {}

class loadingChangeLocalState extends LocaleState {}

class changeModeState extends LocaleState {}

class getModeState extends LocaleState {}

class loadinggetModeState extends LocaleState {}
