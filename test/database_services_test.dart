import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

main() async {
  // Initialize FFI
  sqfliteFfiInit();
  // Change the default factory
  databaseFactory = databaseFactoryFfi;
  test('Insert test', () async {
    var db = await openDatabase(inMemoryDatabasePath, version: 1, onCreate: (db, version) async {
      await db.execute('''
              CREATE TABLE user (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                contact TEXT NOT NULL,
                password TEXT NOT NULL
              )
              ''');
    });
    // Insert some data
    await db.insert('user', {'id': 1, 'contact': '0912345678', 'password': '12345678'});
    // Check content
    expect(await db.query('user'), [
      {'id': 1, 'contact': '0912345678', 'password': '12345678'}
    ]);

    await db.close();
  });
}
