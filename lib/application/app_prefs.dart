import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_360/application/constants.dart';

class AppPreferences {
  final SharedPreferences sharedPreferences;
  AppPreferences({required this.sharedPreferences});

  Future<void> setUserId(int id) async {
    await sharedPreferences.setInt(Constants.userIdKey, id);
  }

  Future<int?> getUserId() async {
    return sharedPreferences.getInt(Constants.userIdKey);
  }
}
