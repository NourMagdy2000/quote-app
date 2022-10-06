import 'package:equatable/equatable.dart';

class ServerExecption extends Equatable implements Exception {
  final String? message;
  const ServerExecption([this.message]);
  @override
  // TODO: implement props
  List<Object?> get props => [message];

  String toString() {
    return '$message';
  }
}

class CacheExpecton implements Exception {}

class FetchDataException extends ServerExecption {
  const FetchDataException([message]) : super("error during communication");
}

class BadRequestException extends ServerExecption {
  const BadRequestException([message]) : super("bad request");
}

class UnauthorizedException extends ServerExecption {
  const UnauthorizedException([message]) : super("Unauthorized");
}

class NotFoundException extends ServerExecption {
  const NotFoundException([message]) : super("Not Found");
}

class ConflictException extends ServerExecption {
  const ConflictException([message]) : super("Conflict Occurred");
}

class InternalServerException extends ServerExecption {
  const InternalServerException([message]) : super("Internal Server error");
}
class NoInternetConnectionException extends ServerExecption {
  const NoInternetConnectionException([message]) : super("No Internet Connection");
}
