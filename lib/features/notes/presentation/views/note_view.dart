import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/note_model.dart';
import '../manager/note/note_cubit.dart';
import 'widgets/text_note_detail.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key, required this.note});

  final NoteModel note;

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController(text: widget.note.title);
    var subtitleController = TextEditingController(text: widget.note.subTitle);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(widget.note.color),
      appBar: AppBar(
        foregroundColor: Colors.teal,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'View Note',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.teal,
            fontFamily: 'Playwrite Nigeria Modern',
          ),
        ),
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          BlocProvider.of<NoteCubit>(context).fechAllNotes();
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextNoteDetail(
                    controller: titleController,
                    textStyle: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                    ),
                    onchange: (value) {
                      widget.note.title = value;
                      widget.note.save();
                    },
                  ),
                  TextNoteDetail(
                    controller: subtitleController,
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    onchange: (value) {
                      widget.note.subTitle = value;
                      widget.note.save();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
