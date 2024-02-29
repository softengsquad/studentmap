import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'
    show databaseFactory, databaseFactoryFfi;
import 'package:studentmap/data_layer/database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;

  group("Database fields |", () {
    test("contains tables after initialization", () async {
      var db = await Database.open();

      expect(true, !await db.isDatabaseEmpty());
    });
  });

  group("Database Methods |", () {
    test("getAllBuildings is not empty", () async {
      var db = await Database.open();
      var buildings = await db.getAllBuildings();

      expect(true, buildings.isNotEmpty);
    });

    test(
        "getAllBuildings , first row contains [1, 'Richmond Building', 'uni', FALSE]",
        () async {
      var db = await Database.open();
      var buildings = await db.getAllBuildings();

      var b1 = buildings.first;

      expect(1, b1.id);
      expect("Richmond Building", b1.name);
      expect("uni", b1.type);
      expect(false, b1.favourited);
    });
  });
}
