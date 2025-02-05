import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constant.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../data/models/note_model.dart';
import '../../manager/note/note_cubit.dart';

Future<dynamic> deleteNoteDialog(context, NoteModel note) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kBackground,
          actionsPadding:
              const EdgeInsets.only(bottom: 30.0, left: 40.0, right: 40.0),
          titlePadding:
              const EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          title: const Text(
            'هل أنت متأكد من حذف الملاحظة ؟',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0),
          ),
          content: Text(
            note.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20.0),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                  child: MaterialButton(
                    elevation: 20.0,
                    color: Colors.teal,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'لا',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                  child: MaterialButton(
                    elevation: 20.0,
                    color: Colors.teal,
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NoteCubit>(context).fechAllNotes();
                      Navigator.pop(context);
                      showTopSnackBar(
                        dismissType: DismissType.onSwipe,
                        reverseAnimationDuration:
                            const Duration(milliseconds: 400),
                        displayDuration: const Duration(milliseconds: 500),
                        animationDuration: const Duration(milliseconds: 600),
                        Overlay.of(context),
                        CustomSnackBar.success(
                          backgroundColor: kBackground.withOpacity(0.6),
                          icon: const Icon(Icons.done, size: 0),
                          message: 'تم الحذف بنجاح',
                        ),
                      );
                    },
                    child: const Text(
                      'نعم',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
