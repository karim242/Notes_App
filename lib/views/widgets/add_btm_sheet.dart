import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/views/widgets/custom_btn.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CustomTextFormField(
              hintText: "title",
              hintcolor: kprimaryColor,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextFormField(
              maxLines: 4,
              hintText: "Content",
              hintcolor: kprimaryColor,
            ),
            const SizedBox(
              height: 64,
            ),
            const CustomButton(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
