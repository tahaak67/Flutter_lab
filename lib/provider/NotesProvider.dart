import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NotesProvider extends ChangeNotifier{

  List<Map>? notes;
  Database? database;

  NotesProvider(){
    createDatabase();
  }

  Future<void> createDatabase() async {
    var databasesPath = await getDatabasesPath();
    // open the database
    database = await openDatabase("notes.db", version: 1,
        onCreate: (Database db, int version) async {
          print("database created!");
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Note (id INTEGER PRIMARY KEY, content TEXT)');
          print("table created!");
        },
        onOpen: (database) async {
          // Get the records
          notes = await database.rawQuery('SELECT * FROM Note');
          print("notes: ${notes.toString()}");
          print("database opened!");

        }
    );
  }

  Future<void> getNotes() async {
    notes = await database?.rawQuery('SELECT * FROM Note');
    notifyListeners();
  }

  Future<void> deleteNote(int id) async {
    // Delete a record
    await database
        ?.rawDelete('DELETE FROM Note WHERE id = $id');
    getNotes();
  }

  Future<void> insertToDatabase(String note) async {
    // Insert some records in a transaction
    await database?.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Note(content) VALUES("$note")');
      print('inserted: $id1');
    });
    getNotes();
  }

}