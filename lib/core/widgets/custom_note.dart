import 'package:flutter/material.dart';
import '../../features/notes/data/models/note_model.dart';
import '../../features/notes/presentation/views/note_view.dart';
import '../../features/notes/presentation/views/widgets/delete_note_dialog.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    note.title,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              note.date,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.4),
                fontFamily: 'Playwrite Nigeria Modern',
              ),
            ),
          ],
        ),
      ),
      onLongPress: () {
        deleteNoteDialog(context, note);
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NoteView(note: note);
            },
          ),
        );
      },
    );
  }
}
