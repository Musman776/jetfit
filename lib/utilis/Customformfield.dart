import 'package:flutter/material.dart';
import 'package:jetfit/utilis/theme_data.dart';

class CustomFormField extends StatelessWidget {
  final String? description;
  final int? age;

  final TextEditingController controller;
  final String? hint;
  final String? labell;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  CustomFormField({
    super.key,
    this.description,
    this.age,
    required this.controller,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.hint,
    this.labell,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: formKey,
        child: TextFormField(
          enabled: false,
          controller: controller,
          style: TextStyle(color: Colors.white),
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: MyThemeData.background,
            filled: true,
            hintText: 'hint',
            contentPadding: EdgeInsets.symmetric(vertical: 1),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
    );
  }
}
