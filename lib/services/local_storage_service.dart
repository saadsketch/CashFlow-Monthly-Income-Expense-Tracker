import 'package:cash_flow/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _prefs;

  static const _keyUser = "user";
  static const _keyIsLoggedIn = "isLoggedIn";

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isLoggedIn => _prefs?.getBool(_keyIsLoggedIn) ?? false;
  static set isLoggedIn(bool value) => _prefs?.setBool(_keyIsLoggedIn, value);

  static UserModel? get user {
    final jsonString = _prefs?.getString(_keyUser);
    if (jsonString == null) return null;
    return UserModel.fromJson(jsonString);
  }

  static set user(UserModel? userModel) {
    if (userModel == null) {
      _prefs?.remove(_keyUser);
    } else {
      _prefs?.setString(_keyUser, userModel.toJson());
    }
  }

  static void clear() {
    _prefs?.clear();
  }
}
