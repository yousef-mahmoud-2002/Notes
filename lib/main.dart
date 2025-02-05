import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/notes/data/models/note_model.dart';
import 'features/notes/presentation/manager/note/note_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        title: 'Notes',
        home: SplashView(),
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
