import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hirconn_app/services/storage_services/value_storage.dart';

class StorageImpl {
  StorageImpl(this.fileName, [this.path]);

  final String? path;
  final String fileName;
  SharedPreferences? _prefs;

  ValueStorage<Map<String, dynamic>> subject =
  ValueStorage<Map<String, dynamic>>(<String, dynamic>{});

  void clear() {
    _prefs?.remove(fileName);
    subject.value.clear();

    subject
      ..value.clear()
      ..changeValue("", null);
  }

  Future<bool> _exists() async {
    return _prefs?.containsKey(fileName) ?? false;
  }

  Future<void> flush() {
    return _writeToStorage(subject.value);
  }

  T? read<T>(String key) {
    return subject.value[key] as T?;
  }

  T getKeys<T>() {
    return subject.value.keys as T;
  }

  T getValues<T>() {
    return subject.value.values as T;
  }

  Future<void> init([Map<String, dynamic>? initialData]) async {
    _prefs = await SharedPreferences.getInstance();
    subject.value = initialData ?? <String, dynamic>{};
    if (await _exists()) {
      await _readFromStorage();
    } else {
      await _writeToStorage(subject.value);
    }
    return;
  }

  void remove(String key) {
    subject
      ..value.remove(key)
      ..changeValue(key, null);
    //  return _writeToStorage(subject.value);
  }

  void write(String key, dynamic value) {
    subject
      ..value[key] = value
      ..changeValue(key, value);
    //return _writeToStorage(subject.value);
  }

  // void writeInMemory(String key, dynamic value) {

  // }

  Future<void> _writeToStorage(Map<String, dynamic> data) async {
    await _prefs?.setString(fileName, json.encode(subject.value));
  }

  Future<void> _readFromStorage() async {
    final dataFromLocal = _prefs?.getString(fileName);
    if (dataFromLocal != null) {
      subject.value = json.decode(dataFromLocal) as Map<String, dynamic>;
    } else {
      await _writeToStorage(<String, dynamic>{});
    }
  }
}

extension FirstWhereExt<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
