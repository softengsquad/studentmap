import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' show databaseFactory, databaseFactoryFfi;
import 'package:studentmap/data_layer/database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;

  group("Database", () {
    test("contains tables after initialization", () async {
      var db = await Database.open();

      assert(!await db.isDatabaseEmpty());
    });

    test("contains buildings in table", () async {
      var db = await Database.open();
      var buildings = await db.getAllBuildings();

      assert(buildings.isNotEmpty);
    });
  });
}
