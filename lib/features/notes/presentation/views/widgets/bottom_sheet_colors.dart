import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/note/note_cubit.dart';
import 'color_item.dart';

class BottomSheetColors extends StatefulWidget {
  const BottomSheetColors({super.key});

  @override
  State<BottomSheetColors> createState() => _BottomSheetColorsState();
}

class _BottomSheetColorsState extends State<BottomSheetColors> {
  int currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).color = colors[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                BlocProvider.of<NoteCubit>(context).color = colors[index];
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ColorItem(
                isActive: currentIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

List<Color> colors = const [
  Color(0xffFFE4F1),
  Color(0xffF2E6FF),
  Color(0xffFAE3D9),
  Color(0xffFFB6B9),
  Color(0xffF3F2F1),
  Color(0xffE2F1FF),
  Color(0xffE4F9E0),
  Color(0xffFFF7D1),
  Color(0xffBBDED6),
  Color(0xff8AC6D1),
  Color(0xffBB8FEB),
  Color(0xffEA75AD),
  Color(0xffE8628F),
  Color(0xff696969),
];
