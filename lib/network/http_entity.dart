
import 'base_model.dart';

class HttpEntity extends IBaseEntity {
  bool? status;
  int? errorCode;
  String? errorDesc;
  dynamic data;

  HttpEntity({this.status, this.errorCode, this.errorDesc, this.data});

  static HttpEntity? fromJson(Map<String, dynamic> json) {
    HttpEntity entity = HttpEntity();
    entity.data = json["data"];
    entity.status = json["status"];
    entity.errorCode = json["errorCode"];
    entity.errorDesc = json["errorDesc"];
    return entity;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['data'] = this.data;
    data['errorDesc'] = errorDesc;
    data['status'] = status;
    data['errorCode'] = errorCode;
    return data;
  }

  @override
  getData() {
    return data;
  }

  @override
  String getMsg() {
    return errorDesc ?? "";
  }

  @override
  bool isSuccess() {
    return status ?? false;
  }

  @override
  void setData(data) {
    this.data = data;
  }
}