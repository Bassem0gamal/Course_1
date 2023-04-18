import 'package:uuid/uuid.dart';

class Note {
  final String id;
  final String name;

  Note({required this.name}) : id = const Uuid().v4();
}
