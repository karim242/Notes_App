import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/views/widgets/custom_appBar.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

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
              const CustomAppBar(
                title: 'Edit Note',
                icon: Icons.check,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                hintText: 'title',
                hintcolor: kprimaryColor,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: "Content",
                maxLines: 4,
                hintcolor: kprimaryColor,
              )
            ],
          )),
    );
  }
}
