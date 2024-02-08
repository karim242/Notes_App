import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_btn.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

import 'form_add_note_btm_sheet.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
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
                msg: " Done !",
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
                child: const FormAddNoteBtmsheet());
          },
        ),
      ),
    );
  }
}
