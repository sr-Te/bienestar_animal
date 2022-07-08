import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

abstract class Failure extends Equatable {
  final String? message;
  const Failure({this.message});
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InternetFailure extends Failure {}

class ClientFailure extends Failure {
  final String? message;
  const ClientFailure({this.message}) : super(message: message);
}

class FailureMessage {
  static String server = 'Error de servidor';
  static String unexpected = 'Error inesperado D:';
  static String internet = 'Parece que no tienes internet :(';
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ClientFailure:
      return failure.message ?? FailureMessage.unexpected;
    case InternetFailure:
      return FailureMessage.internet;
    case ServerFailure:
      return FailureMessage.server;
    default:
      return FailureMessage.unexpected;
  }
}

Either<Failure, T> mapResToFailureOrSuccess<T>(Response res, T onSucess) {
  if (res.statusCode >= 400 && res.statusCode < 500) {
    return Left(ClientFailure(message: json.decode(res.body)['message']));
  } else if (res.statusCode >= 500) {
    return Left(ServerFailure());
  } else {
    return Right(onSucess);
  }
}
