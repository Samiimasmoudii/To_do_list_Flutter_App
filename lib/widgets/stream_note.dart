
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/task_widgets.dart';

import '../data/firestor.dart';

class Stream_note extends StatelessWidget {
  bool done;
  Stream_note(this.done, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore_Datasource().stream(done),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final noteslist = Firestore_Datasource().getNotes(snapshot);
          if (noteslist.length==0 && !this.done) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/10.png', // Replace 'assets/images/image10.png' with your image path
                    width: 150, // Adjust the width as needed
                  ),

                  const SizedBox(height: 20),
                  Text(
                    'Ajouter une tache',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }

        else{
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final note = noteslist[index];
              return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    Firestore_Datasource().delet_note(note.id);
                  },
                  child: Task_Widget(note));
            },
            itemCount: noteslist.length,
          );
        }});

}
}