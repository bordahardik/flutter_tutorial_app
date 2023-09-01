import 'package:get_storage/get_storage.dart';

class PreferenceUtils {
  static GetStorage getStorage = GetStorage();

  static String isLogin = 'isLogin';
  static String userName = 'userName';

  /// IS LOGIN
  static setIsLogin(bool value) async {
    await getStorage.write(isLogin, value);
  }

  static bool getIsLogin() {
    return getStorage.read(isLogin) ?? false;
  }

  /// USER NAME
  static setUserName(String value) async {
    await getStorage.write(userName, value);
  }

  static String getUserName() {
    return getStorage.read(userName) ?? '';
  }
}
