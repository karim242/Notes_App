import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/cubits/add_notes_cubit.dart';

import 'form_add_note_btm_sheet.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            Fluttertoast.showToast(
              msg: " An  error occurred!",
            );
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            Fluttertoast.showToast(
              msg: " Added  successfully!",
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: FormAddNoteBtmsheet(),
              ),
            ),
          );
        },
      ),
    );
  }
}
