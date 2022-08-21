import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/items_models.dart';

class NewsDbProvider {
  Database? db;

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path =join(documentsDirectory.path);
    db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database newDb,int version ){
          newDb.execute("""
            CREATE TABLE Items
              (
                id INTEGER PRIMARY KEY,
                type TEXT,
                by TEXT,
                time INTEGER,
                text TEXT,
                parent INTEGER,
                kids BLOB,
                dead INTEGER,
                deleted INTEGER,
                url TEXT,
                score INTEGER,
                title TEXT,
                descendants INTEGER
              )
          """);
        }
    );
  }

  fetchItems(int id) async {
    final map =await db?.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if(map!.length > 0){
      return ItemModel.fromDb(map.first);
    }
    return null;
  }

  addItems() {

  }


}