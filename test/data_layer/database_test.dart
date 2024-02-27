import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' show databaseFactory, databaseFactoryFfi;
import 'package:studentmap/data_layer/database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;

  group("Database tests |", () {
    test("Database contains tables after initialization", () async {
      var db = await Database.open();

      assert(!await db.isDatabaseEmpty());
    });
  });
}
