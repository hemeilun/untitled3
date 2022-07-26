
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class EncryptUtil {
  /// md5 加密
  static String generateMD5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}