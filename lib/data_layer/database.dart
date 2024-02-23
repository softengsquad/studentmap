import "package:sqflite/sqflite.dart" as sqflite;

class Database {
    final sqflite.Database _internalDb;

    Database(this._internalDb);

    Future<Database> init() async {
        return Database(await _initDb());
    }

    Future<sqflite.Database> _initDb() async {
        return sqflite.openDatabase("studentmap.db");
    }
}
