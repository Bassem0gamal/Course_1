import 'package:flutter/material.dart';

import 'note_model.dart';

class NoteBook extends ValueNotifier<List<Note>> {
  NoteBook._sharedInstance() : super([]);

  static final NoteBook _shared = NoteBook._sharedInstance();

  factory NoteBook() => _shared;

  int get length => value.length;

  void add({required Note contact}) {
    final notes = value;
    notes.add(contact);
    notifyListeners();
  }

  void remove({required Note contact}) {
    final notes = value;
    if (notes.contains(contact)) {
      notes.remove(contact);
      notifyListeners();
    }
  }

  Note? note({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
