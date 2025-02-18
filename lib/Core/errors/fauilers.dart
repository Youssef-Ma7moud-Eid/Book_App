import 'package:dio/dio.dart';

abstract class Fauilers {
  final dynamic errMessage;

  Fauilers({required this.errMessage});
}

class ServerFauilre extends Fauilers {
  ServerFauilre(String message) : super(errMessage: message);
  factory ServerFauilre.DioException(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFauilre('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFauilre('Sendtimeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFauilre('ReceiveTimeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFauilre('BadCertificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFauilre.fromResponse(
            dioerror.response!.statusCode!, dioerror.response!.data);
      case DioExceptionType.cancel:
        return ServerFauilre('Request with ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFauilre('ConnectionError with ApiServer');
      case DioExceptionType.unknown:
      
          return ServerFauilre('unknown Error please try  again');
        
    }
  }
  factory ServerFauilre.fromResponse(
      int statuscode, Map<String, dynamic> response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFauilre(response["error"]["message"]);
    } else if (statuscode == 404) {
      return ServerFauilre('your request Not founded please try again later!');
    } else if (statuscode == 500) {
      return ServerFauilre('Internal Server error,please try again later');
    } else {
      return ServerFauilre('Oops there was an Error ,please try again');
    }
  }
}
