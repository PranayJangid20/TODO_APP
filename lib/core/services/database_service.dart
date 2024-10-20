abstract class DatabaseService {
  Future<void> setData(String key, List<Map> data);
  List? getData(String key);
}