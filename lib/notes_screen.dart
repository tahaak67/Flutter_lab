import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);

  List<Map>? _notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
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
          ? const Center(child: Text("No Notes"))
          : ListView.separated(
              itemBuilder: (context, index) => Card(
                    shape: const RoundedRectangleBorder(),
                    child: Text(_notes?[index]['content']),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              itemCount: _notes!.length),
    );
  }
}

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({Key? key}) : super(key: key);

  var noteController = TextEditingController();

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
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo: insert note
          Navigator.pop(context);
        },
        child: const Icon(Icons.note_add),
      ),
    );
  }
}
