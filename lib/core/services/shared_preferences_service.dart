import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_task/core/services/database_service.dart';

class SharedPreferencesService implements DatabaseService {
  final SharedPreferences _preferences;

  SharedPreferencesService({required SharedPreferences preferences}) : _preferences = preferences;

  // Save data
  @override
  Future<void> setData(String key, List<Map> data) async {
    try {
      List<String> result = data.map((e) => jsonEncode(e)).toList();
      await _preferences.setStringList(key, result);
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  // Retrieve data
  @override
  List? getData(String key) {
    try {
      List<String>? data = _preferences.getStringList(key);

      if (data != null && data.isNotEmpty) {

        List result = data.map((e) => jsonDecode(e)).toList();
        return result;

      }
    }
    catch(e){
      debugPrint(e.toString());
    }

    return [];
  }
}
