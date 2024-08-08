// This class handles local storage of key-value pairs (e.g., username, email).
//
import 'package:get_storage/get_storage.dart';

class Preferences {
  Preferences._();

  static Preferences? _preferences;

  static Preferences get instance {
    return _preferences ?? Preferences._();
  }

  final GetStorage prefs = GetStorage("AfterMarket Storage");

  // initializing the storage
  Future<void> initPrefs() async {
    await GetStorage.init("AfterMarket Storage");
  }

  // clearing the local storage
  void clearLocalStorage() {
    prefs.erase();
  }
}
