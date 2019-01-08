import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:first_project/model/User.dart';

class DBHelper {
  Database db;

  Future<Database> get getDb async {
    if (db != null) return db;
    db = await initDb();
    return db;
  }

  ///Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path,
        version: 1,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade);
    return theDb;
  }

  // Creating a table name "User" with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE ${User.tableUser}(${User.columnId} INTEGER PRIMARY KEY, ${User.columnFirstName} TEXT, ${User.columnLastName} TEXT, ${User.columnPhone} TEXT,${User.columnEmail} TEXT,${User.columnAddress} TEXT,${User.columnPassword} TEXT,${User.columnGender} TEXT )");
    print("Created tables");
  }

  ///OnUpgrade is useful when we need to modify database and its depends on version.
  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("oldVersion :" +
        oldVersion.toString() +
        " newVersion :" +
        newVersion.toString());
  }

  void _onDowngrade(Database db, int oldVersion, int newVersion) {
    print("oldVersion :" +
        oldVersion.toString() +
        " newVersion :" +
        newVersion.toString());
  }

  void saveUser(User user) async {
    var dbClient = await getDb;

    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO ${User.tableUser}(${User.columnFirstName}, ${User.columnLastName}, ${User.columnPhone}, ${User.columnEmail},${User.columnAddress},${User.columnPassword},${User.columnGender}) VALUES (?,?,?,?,?,?,?)',
          [
            user.firstName,
            user.lastName,
            user.phone,
            user.email,
            user.address,
            user.password,
            user.gender
          ]);
    });
  }

  Future<List<User>> getUsers() async {
    var dbClient = await getDb;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM ${User.tableUser}');
    List<User> users = new List();
    for (int i = 0; i < list.length; i++) {
      users.add(User(
          list[i]["${User.columnFirstName}"],
          list[i]["${User.columnLastName}"],
          list[i]["${User.columnPhone}"],
          list[i]["${User.columnEmail}"],
          list[i]["${User.columnAddress}"],
          list[i]["${User.columnPassword}"],
          list[i]["${User.columnGender}"]));
    }
    print(users.length);
    return users;
  }

  Future<User> getUsersByEmail(String email, String password) async {
    var dbClient = await getDb;
    List<Map> result = await dbClient.query(User.tableUser,
        columns: [
          User.columnId,
          User.columnFirstName,
          User.columnLastName,
          User.columnEmail,
          User.columnGender
        ],
        where: '${User.columnEmail}=? and ${User.columnPassword}=?',
        whereArgs: [email, password]);

    if (result.length > 0) {
      return User.fromMap(result.first);
    }

    return null;
  }

  void tableCount() async {
    var dbClient = await getDb;
    List<Map> list = await dbClient
        .rawQuery("SELECT * FROM sqlite_master WHERE type='table'");
    for (int i = 0; i < list.length; i++) {
      print(list[i]["tbl_name"]);
    }
  }
}
