import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_item.dart';

class EditNotesColorList extends StatefulWidget {
  const EditNotesColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNotesColorList> createState() => _EditNotesColorListState();
}

class _EditNotesColorListState extends State<EditNotesColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
              widget.note.color = kColors[index].value;
            });
          },
          child: ColorsItem(
            color: kColors[index],
            isActive: currentIndex == index,
          ),
        ),
      ),
    );
  }
}
