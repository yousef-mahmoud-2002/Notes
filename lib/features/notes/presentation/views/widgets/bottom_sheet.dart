import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:notes/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/note_model.dart';
import '../../manager/note/note_cubit.dart';
import 'bottom_sheet_colors.dart';

class BottomSheetView extends StatefulWidget {
  const BottomSheetView({super.key, required this.context});

  final BuildContext context;
  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  String? title, subTitle;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  _BottomSheetViewState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                onSaved: (value) {
                  title = value;
                },
                cursorColor: kColor,
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: const TextStyle(
                    fontFamily: 'Playwrite Nigeria Modern',
                    color: kColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: kColor),
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                onSaved: (value) {
                  subTitle = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'content cant be empty';
                  } else {
                    return null;
                  }
                },
                cursorColor: kColor,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Content',
                  hintStyle: const TextStyle(
                    fontFamily: 'Playwrite Nigeria Modern',
                    color: kColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: kColor),
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const BottomSheetColors(),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: DateFormat('yyyy-MM-dd – hh:mm')
                          .format(DateTime.now())
                          .toString(),
                      color: BlocProvider.of<NoteCubit>(context).color!.value,
                    );
                    BlocProvider.of<NoteCubit>(widget.context)
                        .addNote(noteModel);
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontFamily: 'Playwrite Nigeria Modern',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
