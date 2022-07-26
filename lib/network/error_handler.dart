import 'package:dio/dio.dart';

import 'base_model.dart';
import 'http_config.dart';
import 'http_entity.dart';

class ErrorHandler {
  static IBaseEntity handle({int? code, String? msg, DioError? exception}) {
    if (exception != null) {
      // 请求超时
      if (exception.type == DioErrorType.sendTimeout) {
        code = HttpConfig.errorTimeout;
        msg = HttpConfig.msgTimeout;
      } else if (exception.type == DioErrorType.connectTimeout) {
        code = HttpConfig.errorTimeout;
        msg = HttpConfig.msgTimeout;
      } else if (exception.type == DioErrorType.receiveTimeout) {
        code = HttpConfig.errorTimeout;
        msg = HttpConfig.msgTimeout;
      } else if (exception.type == DioErrorType.cancel) {
        code = HttpConfig.errorFail;
        msg = HttpConfig.msgCancel;
      } else if (exception.type == DioErrorType.response) {
        code = HttpConfig.errorServer;
        msg = HttpConfig.msgServerError;
      } else if (exception.type == DioErrorType.other) {
        code = HttpConfig.errorNetwork;
        msg = HttpConfig.msgNetwork;
      } else {
        code = HttpConfig.errorFail;
        msg = HttpConfig.msgFail;
      }
    }
    return HttpEntity(status: false, errorDesc: msg);
  }
}
