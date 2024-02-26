import "package:flutter/services.dart" show rootBundle;
import "package:sqflite/sqflite.dart" as sqflite;
import "/util.dart";
import "/domain_layer/building_manager/building.dart";

/// Describes a local database used to store various information
/// pertraining to buildings, bus routes, favourites, etc.
class Database {
    final sqflite.Database _internalDb;

    Database(this._internalDb);

    /// Opens a connection to the local database.
    static Future<Database> open() async {
        var internalDb = await sqflite.openDatabase(_getDatabaseName());

        var db = Database(internalDb);
        await db._init();

        return db;
    }

    /// Returns the local file name of the database. A different filename is
    /// returned when in testing mode, as given by isTesting().
    static String _getDatabaseName() {
        return isTesting() ? "studentmap.db" : "studentmap_testing.db";
    }

    Future<void> _init() async {
        if (await isDatabaseEmpty()) {
            _internalDb.execute(await _getSchemaSql());
            _internalDb.execute(await _getPopulateSql());
        }

        getAllBuildings();
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

    /// Retrieves all buildings from the database and converts
    /// them into classes of type Building.
    Future<List<Building>> getAllBuildings() async {
        var res = await _internalDb.query(
            "building",
            columns: [
                "building_id",
                "name",
                "addressline1",
                "addressline2",
                "postcode",
                "type",
                "longitude",
                "latitude",
                "favourited"
            ],
        );

        List<Building> buildings = [];

        for (var row in res) {
            buildings.add(Building(
                id: row["building_id"] as int,
                name: row["name"] as String,
                addressLine1: row["addressline1"] as String,
                addressLine2: row["addressline2"] != null
                    ? row["addressline2"] as String : "",
                postcode: row["postcode"] as String,
                type: row["type"] as String,
                favourited: row["favourited"] == 1 ? true : false,
                longitude: row["longitude"] as double,
                latitude: row["latitude"] as double,
            ));
        }

        return buildings;
    }
}
