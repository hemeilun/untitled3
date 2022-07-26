enum Method {
  post,
  get,
}

class HttpConfig {
  static const String baseURL = "http://tst.api.51juanyijuan.com";
  static const int connectTimeout = 15000;
  static const int receiveTimeout = 15000;
  static const int sendTimeout = 30000;

  static const int errorTokenMiss = 401;
  static const int errorUnknown = 405;
  static const int errorNotFound = 404;
  static const int errorServer = 501;
  static const int errorTimeout = 503;
  static const int errorNetwork = 504;
  static const int errorFail = 505;

  static const String msgTokenMiss = "登录已失效，请重新登录";
  static const String msgUnknown = "未知异常";
  static const String msgTimeout = "服务器连接超时";
  static const String msgFail = "服务器连接失败";
  static const String msgServerError = "服务异常";
  static const String msgCancel = "请求已取消";
  static const String msgNetwork = "连接失败，请检查网络后重试";


  static const String uploadFile = "";
}
