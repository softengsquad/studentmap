import "package:flutter/services.dart" show rootBundle;
import "package:sqflite/sqflite.dart" as sqflite;

/// Describes a local database used to store various information
/// pertraining to buildings, bus routes, favourites, etc.
class Database {
    final sqflite.Database _internalDb;

    Database(this._internalDb);

    /// Opens a connection to the local database.
    static Future<Database> open() async {
        var internalDb = await sqflite.openDatabase("studentmap.db");

        var db = Database(internalDb);
        await db._init();

        return db;
    }

    Future<void> _init() async {
        if (await isDatabaseEmpty()) {
            _internalDb.execute(await _getSchemaSql());
            _internalDb.execute(await _getPopulateSql());
        }
    }

    Future<String> _getSchemaSql() async {
        return await rootBundle.loadString("assets/sql/schema.sql");
    }

    Future<String> _getPopulateSql() async {
        return await rootBundle.loadString("assets/sql/populate.sql");
    }

    /// Returns the number of user tables in the database. 
    /// Does not include internal/system tables.
    Future<int> getTableCount() async {
        var res = await _internalDb.query(
            "sqlite_master",
            columns: ["count(*)"],
            where: "type = 'table' AND name != 'android_metadata' AND name != 'sqlite_sequence'"
        );

        return res.first["count(*)"] as int;
    }

    /// Returns true if the database contains 0 user tables.
    /// See getTableCount()
    Future<bool> isDatabaseEmpty() async {
        return await getTableCount() <= 0;
    }
}
