import 'package:flutter/material.dart';

import 'my_box_widget.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final int maxLines;
  final bool isObscured;
  final bool isRequired;
  final TextInputType textInputType;
  final Color? filledColor;
  Function? validator;

  TextFieldWidget(
      {required this.controller,
      required this.name,
      this.maxLines = 1,
      this.isRequired = true,
      this.isObscured = false,
      this.textInputType = TextInputType.text,
      this.filledColor,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              name,
            ),
            if (isRequired)
              const Padding(
                padding: EdgeInsets.only(left: 2.0),
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              )
          ],
        ),
        MyBoxWidget(
          height: 5,
        ),
        TextFormField(
          validator: validator == null
              ? (value) {
                  if (validator == null || validator!() == null) {
                    if ((value == null || value.isEmpty) && isRequired) {
                      return 'Please enter some text';
                    }
                    return null;
                  }
                  return null;
                }
              : (value) {
                  return validator!();
                },
          controller: controller,
          obscureText: isObscured,
          keyboardType: textInputType,
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
            filled: true,
            fillColor: filledColor ?? Colors.blueGrey.withOpacity(0.15),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
          // cursorColor: baseColor,
          showCursor: true,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
