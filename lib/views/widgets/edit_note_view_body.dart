import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';
import 'package:notes_app/views/widgets/edit_notes_color_list.dart';

import '../../models/note_model.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBar(
                onPressed: () {
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.subTitle =
                      subTitle ?? widget.noteModel.subTitle;
                  widget.noteModel.save();
                  Fluttertoast.showToast(msg: "edit successfully");
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                title: 'Edit Note',
                icon: Icons.check,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                hintText: widget.noteModel.title,
                hintcolor: kprimaryColor,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: widget.noteModel.subTitle,
                maxLines: 4,
                hintcolor: kprimaryColor,
                onChanged: (value) {
                  subTitle = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              EditNotesColorList(
                note: widget.noteModel,
              )
            ],
          )),
    );
  }
}
