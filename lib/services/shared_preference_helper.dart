import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "token";
  static const String userName = "username";
  static const String passWord = "password";
  static const String isLogin = 'isLogin';
  final SharedPreferences prefs;
  SharedPreferenceHelper({required this.prefs});
  Future<void> setUserToken({required String userToken}) async {
    await prefs.setString(token, userToken);
  }
  String? getUserToken() {
    final userToken = prefs.getString(token);
    return userToken;
  }

  Future<void> setIsLogin({required bool isLogint}) async {
    await prefs.setBool(isLogin, isLogint);
  }
  bool? getIsLogin() {
    final userLogin = prefs.getBool(isLogin);
    return userLogin;
  }
}