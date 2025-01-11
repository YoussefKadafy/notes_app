import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/cubits/add_notes_cubit.dart/add_note_cubit.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors = kColors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;

              BlocProvider.of<AddNoteCubit>(context).color = colors[index];

              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ColorIcon(
                colors: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class ColorIcon extends StatelessWidget {
  const ColorIcon({super.key, required this.isActive, required this.colors});
  final bool isActive;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            child: CircleAvatar(
              backgroundColor: colors,
              radius: 30,
            ),
          )
        : CircleAvatar(
            backgroundColor: colors,
            radius: 32,
          );
  }
}
