import 'database_helper.dart';

class DatabaseServices {
  final dbHelper = DatabaseHelper.instance;

  Future insertItem(Map<String, dynamic> map, String tableName) async {
    return await dbHelper.insert(map, tableName);
  }

  Future updateItem(Map<String, dynamic> map, String tableName) async {
    return await dbHelper.update(map, tableName);
  }

  Future deleteItem(int id, String tableName) async {
    return await dbHelper.delete(id, tableName);
  }
}
