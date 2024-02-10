import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_btn.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class FormAddNoteBtmsheet extends StatefulWidget {
  const FormAddNoteBtmsheet({
    super.key,
  });

  @override
  State<FormAddNoteBtmsheet> createState() => _FormAddNoteBtmsheetState();
}

class _FormAddNoteBtmsheetState extends State<FormAddNoteBtmsheet> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    final addNoteCubit = BlocProvider.of<AddNoteCubit>(context);
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            hintText: "title",
            hintcolor: kprimaryColor,
            onSaved: (value) {
              title = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter a title';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
              maxLines: 4,
              hintText: "Content",
              hintcolor: kprimaryColor,
              onSaved: (value) {
                subTitle = value;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter a Content';
                } else {
                  return null;
                }
              }),
          const SizedBox(
            height: 64,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: DateTime.now().toString(),
                        color: Colors.grey.value);

                    addNoteCubit.addNotesToBox(noteModel);
                  } else {
                    _autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
