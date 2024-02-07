import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    required this.hintText,
    this.hintcolor,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.maxLines
  });

  TextEditingController? controller;
  FocusNode? focusNode;
  Widget? suffixIcon;
  Widget? prefixIcon;

  final String hintText;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  bool? obscureText;
  Color? hintcolor;
  int? maxLines;
  String? Function(String?)? validator;
  Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      focusNode: focusNode,
      cursorColor: hintcolor,
      maxLines: maxLines,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintcolor),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: builderBorder(),
          enabledBorder: builderBorder(),
          focusedBorder: builderBorder(hintcolor)),
    );
  }

  OutlineInputBorder builderBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
