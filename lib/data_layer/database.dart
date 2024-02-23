import "package:flutter/services.dart" show rootBundle;
import "package:sqflite/sqflite.dart" as sqflite;

/// Describes a local database used to store various information
/// pertraining to buildings, bus routes, favourites, etc.
class Database {
    final sqflite.Database _internalDb;

    Database(this._internalDb);

    /// Opens a connection to the local database.
    Future<Database> open() async {
        var internalDb = await sqflite.openDatabase("studentmap.db");
        internalDb.execute(await _getSchemaSql());

        return Database(internalDb);
    }

    static Future<String> _getSchemaSql() async {
        return await rootBundle.loadString("assets/sql/schema.sql");
    }
}
