import 'package:flutter/material.dart';

import '../model/contact_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home PAge'),
      ),
      body: ValueListenableBuilder(
        valueListenable: ContactBook(),
        builder: (context, value, child) {
          final contacts = value;
          return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Dismissible(
                  onDismissed: (direction) {
                    ContactBook().remove(contact: contact);
                  },
                  key: ValueKey(contact.id),
                  child: Column(
                    children: [
                      Material(
                        color: Colors.white,
                        elevation: 6.0,
                        child: ListTile(
                          title: Text(contact.name),
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
          await Navigator.of(context).pushNamed('/new-contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
