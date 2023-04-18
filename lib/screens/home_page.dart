import 'package:flutter/material.dart';

import '../model/note_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home PAge'),
      ),
      body: ValueListenableBuilder(
        valueListenable: NoteBook(),
        builder: (context, value, child) {
          final notes = value;
          return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Dismissible(
                  onDismissed: (direction) {
                    NoteBook().remove(contact: note);
                  },
                  key: ValueKey(note.id),
                  child: Column(
                    children: [
                      Material(
                        color: Colors.white,
                        elevation: 6.0,
                        child: ListTile(
                          title: Text(note.name),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/new-note');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
