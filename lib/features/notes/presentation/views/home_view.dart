import 'package:flutter/material.dart';
import 'package:notes/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_note.dart';
import '../../data/models/note_model.dart';
import '../manager/note/note_cubit.dart';
import 'widgets/bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: kBackground,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontFamily: 'Playwrite Nigeria Modern',
            fontSize: 25.0,
            color: Colors.teal,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: kBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            context: context,
            builder: (context) {
              return BottomSheetView(context: context);
            },
          );
        },
        child: const CircleAvatar(
          radius: 26.0,
          backgroundColor: kBackground,
          child: Icon(
            Icons.add,
            color: Colors.teal,
          ),
        ),
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          BlocProvider.of<NoteCubit>(context).fechAllNotes();
          List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes;
          if (notes.isEmpty) {
            return const Center(
              child: Text(
                'لا يوجد أي ملاحظات حتى الان',
                style: TextStyle(
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            );
          } else {
            return ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              physics: const BouncingScrollPhysics(),
              itemCount: notes.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return CustomNote(
                  note: notes[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
