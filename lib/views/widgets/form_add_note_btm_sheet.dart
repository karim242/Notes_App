
import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
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
                }
              }),
          const SizedBox(
            height: 64,
          ),
          CustomButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              } else {
                _autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
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
