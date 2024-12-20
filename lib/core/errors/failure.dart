// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class Failure {
  String message;
  Failure({
    required this.message,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "connectionTimeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "failure in sendTimeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "failure inreceiveTimeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(message: "failure in badCertificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(message: "cancel");
      case DioExceptionType.connectionError:
        return ServerFailure(message: "There was a connectionError");
      case DioExceptionType.unknown:
        return ServerFailure(message: "There was a unknown");
    }
  }

  factory ServerFailure.fromResponse(int statuseCode, dynamic response) {
    if (statuseCode == 404) {
      return ServerFailure(
          message: "Your Request is not found,Please Try Again...");
    } else if (statuseCode == 500) {
      return ServerFailure(
          message: "There is problem with server,Please Try Again...");
    } else if (statuseCode == 401 || statuseCode == 403 || statuseCode == 400) {
      return ServerFailure(message: response[0]["error"]["message"]);
    } else {
      return ServerFailure(
          message: "Oops,There was an wrong,Please try agai.. ");
    }
  }
}
