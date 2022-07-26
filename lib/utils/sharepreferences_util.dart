
import 'package:shared_preferences/shared_preferences.dart';

//本地化样例
class SharedPreferencesUtil {
  //数据存储
  static Future<bool> setData<T>(String key, T value) async {
    //获取value的数据类型
    String valueTypeName = value.runtimeType.toString();
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    bool saveIsTrue = true; //保存是否成功
    switch (valueTypeName) {
      case "String":
        _sharedPreferences.setString(key, value as String);
        break;
      case "int":
        _sharedPreferences.setInt(key, value as int);
        break;
      case "double":
        _sharedPreferences.setDouble(key, value as double);
        break;
      case "bool":
        _sharedPreferences.setBool(key, value as bool);
        break;
      case "List<String>":
        _sharedPreferences.setStringList(key, value as List<String>);
        break;
      default:
        saveIsTrue = false;
        break;
    }
    return saveIsTrue;
  }

  static Future<String?> getString(String key) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getString(key);
  }

  static Future<int?> getInt(String key) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getInt(key);
  }

  static Future<List<String>?> getStringList(String key) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getStringList(key);
  }

  //单个删除
  static Future<bool?> removeData(String key) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.remove(key);
  }

  //全部删除
  static Future<bool?> removeAllData() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.clear();
  }
}
