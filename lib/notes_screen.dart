import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Map>? _notes;
  Database? database;

  Future<void> createDatabase() async {
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
        _notes = await database.rawQuery('SELECT * FROM Note');
        print("notes: ${_notes.toString()}");
        print("database opened!");
        setState(() {

        });
      }
    );
  }

  Future<void> getNotes() async {
    _notes = await database?.rawQuery('SELECT * FROM Note');
    setState(() {

    });
  }

  Future<void> deleteNote(int id) async {
    // Delete a record
    await database
        ?.rawDelete('DELETE FROM Note WHERE id = $id');
    getNotes();
  }

  @override
  void initState() {
    createDatabase();
    super.initState();
  }

  @override
  void dispose() {
    database?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          IconButton(onPressed: (){
            getNotes();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: _notes == null
          ? const Center(
              child: Text(
              "No Notes",
              style: TextStyle(fontSize: 32),
            ))
          : ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  int id = _notes?[index]['id'];
                  deleteNote(id);
                },
                child: Card(
                      shape: const RoundedRectangleBorder(),
                      child: Text(
                        _notes?[index]['content'],
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              itemCount: _notes!.length),
    );
  }
}

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  var noteController = TextEditingController();

  Database? database;

  Future<void> createDatabase() async {
    // open the database
    database = await openDatabase("notes.db", version: 1,
        onCreate: (Database db, int version) async {
          print("database created!");
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Note (id INTEGER PRIMARY KEY, content TEXT)');
          print("table created!");
        },
        onOpen: (database) {
          print("database opened!");
        }
    );
  }

  Future<void> insertToDatabase(String note) async {
    // Insert some records in a transaction
    await database?.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Note(content) VALUES("$note")');
      print('inserted: $id1');
    });
  }

  @override
  void initState() {
    createDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a note"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Note"),
                  icon: Icon(Icons.note),
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.multiline,
                controller: noteController,
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertToDatabase(noteController.text);
          Navigator.pop(context);
        },
        child: const Icon(Icons.note_add),
      ),
    );
  }
}
