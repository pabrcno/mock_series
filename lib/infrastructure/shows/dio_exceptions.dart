import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.sendTimeout:
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.response:
        _handleError(dioError.response!.statusCode!, dioError.response!.data);
        break;
      default:
        break;
    }
  }

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 429:
        return 'Too many requests';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }
}
