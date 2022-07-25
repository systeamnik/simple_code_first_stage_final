import 'package:shared_preferences/shared_preferences.dart';

class RepoSettings {
  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> saveLocale(String locale) async {
    if (prefs == null) return false;
    return prefs?.setString('locale', locale);
  }

  Future<String?> readLocale() async {
    if (prefs == null) return null;
    return prefs?.getString('locale');
  }

  Future<bool?> authorize() async {
    if (prefs == null) return false;
    return prefs?.setBool('auth', true);
  }

  Future<bool?> logout() async {
    if (prefs == null) return false;
    return prefs?.setBool('auth', false);
  }

  Future<bool?> isAutorized() async {
    if (prefs == null) return null;
    return prefs?.getBool('auth');
  }
}
