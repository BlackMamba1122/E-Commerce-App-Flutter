import 'package:get_storage/get_storage.dart';

class BLocalStorage {
  late final GetStorage _storage;
  static BLocalStorage? _instance;
  BLocalStorage._internal();

  factory BLocalStorage.instance() {
    _instance ?? BLocalStorage._internal();
    return _instance!;
  }
  static Future<void> init(String name) async {
    await GetStorage.init(name);
    _instance = BLocalStorage._internal();
    _instance!._storage=GetStorage(name);
  }

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}


/// *** *** *** *** *** Example *** *** *** *** *** ///

// LocalStorage localStorage = LocalStorage();
//
// // Save data
// localStorage.saveData('username', 'JohnDoe');
//
// // Read data
// String? username = localStorage.readData<String>('username');
// print('Username: $username'); // Output: Username: JohnDoe
//
// // Remove data
// localStorage.removeData('username');
//
// // Clear all data
// localStorage.clearAll();

