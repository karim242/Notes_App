import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NotesItems extends StatelessWidget {
  const NotesItems({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return const EditNotesView();
        }),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              noteModel.title,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                noteModel.subTitle,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                noteModel.delete();

                Fluttertoast.showToast(
                  msg: " Deleted  successfully!",
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              noteModel.date,
              style: TextStyle(
                color: Colors.black.withOpacity(.4),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
