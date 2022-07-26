
import 'package:dio/dio.dart';

abstract class IBaseEntity {
  dynamic getData();
  void setData(var data);
  String getMsg();
  bool isSuccess();
}

abstract class IResultExecutor {
  IBaseEntity onResponse({Response? response});
  IBaseEntity onError({int code, String msg, DioError exception});
}
