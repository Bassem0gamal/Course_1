import 'package:flutter/material.dart';

import '../model/note_model.dart';
import '../model/note_widget.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new contact'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter a new contact name here...',
              ),
            ),
            TextButton(
                onPressed: () {
                  final contact = Note(name: _controller.text);
                  NoteBook().add(contact: contact);
                  Navigator.of(context).pop();
                },
                child: const Text('Add contact'))
          ],
        ),
      ),
    );
  }
}
