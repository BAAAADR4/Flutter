import 'package:shared_preferences/shared_preferences.dart';

class SettingsPersistence {
  final _prefs = SharedPreferencesAsync();

  Future<void> saveColorIndex(int index) async {
    await _prefs.setInt('colorIndex', index);
  }

  Future<int> loadColorIndex() async {
    return await _prefs.getInt('colorIndex') ?? 0;
  }
}
