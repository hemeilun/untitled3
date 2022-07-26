import 'dart:core';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utils/hud_util.dart';
import 'base_model.dart';
import 'http_config.dart';
import 'http_entity.dart';
import 'http_executor.dart';

class HttpManager {

  Dio? _dio;
  String? token;
  HttpExecutor? _resultExecutor;

  // static final _baseOptions = BaseOptions(
  //   baseUrl: HttpConfig.baseURL,
  //   connectTimeout: HttpConfig.connectTimeout,
  //   receiveTimeout: HttpConfig.receiveTimeout,
  //   sendTimeout: HttpConfig.sendTimeout,
  // );

  static BaseOptions _setupBaseOptions() {
    Map<String, dynamic> headers = {};
    headers["Accept"] = "application/json";
    headers["OS"] = Platform.isAndroid ? "Android" : "IOS";
    headers["timestamp"] = DateTime.now().millisecondsSinceEpoch;
    headers["sign"] = "sign";
    headers["appVersion"] = "1.0.0";
    headers["groupcode"] = "groupcode";

    BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL,
      connectTimeout: HttpConfig.connectTimeout,
      receiveTimeout: HttpConfig.receiveTimeout,
      sendTimeout: HttpConfig.sendTimeout,
      headers: headers,
    );
    return baseOptions;
  }

  static final HttpManager _instance = HttpManager._internal();
  factory HttpManager() => _instance;

  HttpManager._internal() {
    if (_dio == null) {
      _dio = Dio(_setupBaseOptions());
      _resultExecutor = HttpExecutor();
    }
  }

  static HttpManager getInstance({String? url}) {
    if (url != null) {
      return _instance._customUrl(url);
    }
    return _instance._normal();
  }

  // BaseOptions _getOption({String? baseUrl}) {
  //   BaseOptions options = BaseOptions();
  //   options.connectTimeout = HttpConfig.connectTimeout;
  //   options.receiveTimeout = HttpConfig.receiveTimeout;
  //   options.sendTimeout = HttpConfig.sendTimeout;
  //   options.baseUrl = baseUrl ?? HttpConfig.baseURL;
  //
  //   Map<String, dynamic> headers = {};
  //   headers["Accept"] = "application/json";
  //   headers["OS"] = Platform.isAndroid ? "Android" : "IOS";
  //   headers["timestamp"] = DateTime.now().millisecondsSinceEpoch;
  //   headers["sign"] = "sign";
  //   headers["appVersion"] = "1.0.0";
  //   headers["deviceId"] = "deviceId";
  //   headers["deviceName"] = "deviceName";
  //   headers["appMarket"] = "appMarket";
  //   headers["systemVersion"] = "1.0.0";
  //   headers["appKey"] = "appKey";
  //   headers["appID"] = "appID";
  //   headers["groupcode"] = "groupcode";
  //   if (token != null) headers["token"] = token;
  //   options.headers = headers;
  //   return options;
  // }

  HttpManager _normal() {
    // 设置默认的请求URL
    if (_dio?.options.baseUrl != HttpConfig.baseURL) {
      _dio?.options.baseUrl = HttpConfig.baseURL;
    }

    // 设置token
    _dio?.options.headers["token"] = "123456789";

    // 设置代理
    if (kDebugMode) {
      (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return "PROXY 192.168.31.184:8888";
        };
      };
    }
    return this;
  }

  // 自定义域名
  HttpManager _customUrl(String url) {
    // 设置请求URL
    _dio?.options.baseUrl = url;

    // 设置token
    _dio?.options.headers["token"] = "123456789";

    // 设置代理
    if (kDebugMode) {
      (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return "PROXY 192.168.31.184:8888";
        };
      };
    }
    return this;
  }

  Future<IBaseEntity> uploadPic(String path, Map<String, dynamic> map) async {
    try {
      Response response = await _dio!.post(path, data: FormData.fromMap(map));
      debugPrint("$path/${map['key']}");
      return HttpEntity(
          status: true, errorDesc: "上传成功", data: '$path/${map['key']}');
    } catch (e) {
      return HttpEntity(status: false, errorDesc: "上传失败", data: '');
    }
  }

  Future<IBaseEntity> uploadFile(String filePath,
      {required String name, required String businessCode}) async {
    try {
      Options op = Options();
      op.headers = {
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
      };
      Response response = await _dio!.post(
        HttpConfig.uploadFile,
        data: MultipartFile.fromFile(
          filePath,
          filename: name,
        ),
        queryParameters: {"businessCode": businessCode},
        options: op,
        onSendProgress: (count, total) {
          debugPrint((count / total).toString());
        },
      );

      return _resultExecutor!.onResponse(response: response);
    } catch (e) {
      return HttpEntity(status: false, errorDesc: "上传失败", data: '');
    }
  }

  ///接口请求
  Future<IBaseEntity?> request<T>(
      {required String url,
      Method method = Method.post,
      Map<String, dynamic>? params,
      Map<String, dynamic>? header,
      bool formData = false}) async {
    return _requestAsync(url,
        method: method, params: params, formData: formData);
  }

  Future<IBaseEntity?> _requestAsync<T>(String url,
      {Method method = Method.post,
      Map<String, dynamic>? params,
      Map<String, dynamic>? header,
      bool? formData}) async {

    // 设置自定义的请求头
    if (header != null) {
      _dio?.options.headers = header;
    }
    // 设置默认值
    params = params ?? <String, dynamic>{};

    try {
      Response? response;
      switch (method) {
        case Method.get:
          response = await _dio?.get(url, queryParameters: params);
          break;
        case Method.post:
          if (formData == true) {
            response = await _dio?.post(url, data: FormData.fromMap(params),
                onSendProgress: (count, total) {
              debugPrint((count / total).toString());
            });
          } else {
            response = await _dio?.post(url, data: params);
          }
          break;
      }
      final data = response?.data;

      final errorCode = data["errorCode"] ?? 0;
      if (errorCode != 0) {
        if (errorCode == 10002) {
          // AccountMgr().logout();
        }
        HudUtil.toast(data["errorDesc"]);
      }
      return _resultExecutor?.onResponse(response: response);
    } on DioError catch (e) {
      debugPrint("Exception:$e");
      return _resultExecutor!.onError(exception: e);
    }
  }
}
