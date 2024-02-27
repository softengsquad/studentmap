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
  });

  group("Database buildings", () {
    test("table is not empty", () async {
      var db = await Database.open();
      var buildings = await db.getAllBuildings();

      assert(buildings.isNotEmpty);
    });

    test("first building row is valid", () async {
      var db = await Database.open();
      var buildings = await db.getAllBuildings();

      var b1 = buildings.first;

      assert(b1.id == 1);
      assert(b1.name == "Richmond Building");
      assert(b1.type == "uni");
      assert(!b1.favourited);
    });
  });
}
