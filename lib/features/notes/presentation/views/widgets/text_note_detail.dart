import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constant.dart';

import '../../manager/note/note_cubit.dart';

class TextNoteDetail extends StatelessWidget {
  const TextNoteDetail({
    super.key,
    required this.controller,
    required this.textStyle,
    required this.onchange,
  });

  final TextStyle textStyle;
  final void Function(String) onchange;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      style: textStyle,
      onChanged: onchange,
      controller: controller,
      textAlign: TextAlign.start,
      cursorColor: kPrimaryColor,
      textDirection: TextDirection.rtl,
      textInputAction: TextInputAction.newline,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onEditingComplete: () {
        BlocProvider.of<NoteCubit>(context).fechAllNotes();
      },
    );
  }
}
