import 'package:todo_app_task/core/services/database_service.dart';

class TestDatabaseService implements DatabaseService{

  List<Map> _data = [];

  @override
  List? getData(String key) {
    return _data;
  }

  @override
  Future<void> setData(String key, List<Map> data) async {
    _data = data;
  }


}