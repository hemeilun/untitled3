import 'package:dio/dio.dart';
import 'package:short_video/network/http_config.dart';
import 'package:short_video/utils/hud_util.dart';

import 'base_model.dart';
import 'error_handler.dart';
import 'http_entity.dart';

class HttpExecutor extends IResultExecutor {
  @override
  IBaseEntity onResponse({Response? response}) {
    if (response == null) {
      return onError(code: HttpConfig.errorUnknown, msg: HttpConfig.msgUnknown);
    }
    int? code = response.statusCode;
    if (code != 200) {
      // if (code == 401) {
      //   HudUtil.toast("登录已过期,请重新登录");
      // }
      return onError(code: code, msg: response.statusMessage!);
    }
    HttpEntity? baseResult = HttpEntity.fromJson(response.data);
    if (baseResult == null) {
      return HttpEntity(status: false, errorDesc: HttpConfig.msgUnknown);
    }

    return baseResult;
  }

  @override
  IBaseEntity onError({int? code, String? msg, DioError? exception}) {
    return ErrorHandler.handle(code: code, msg: msg, exception: exception);
  }
}


