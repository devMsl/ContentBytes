import 'package:flutter/material.dart';

class TextBtnWidget extends StatelessWidget {
  final String name;
  Color? btnColor;
  Color? nameColor;
  VoidCallback onTap;
  bool isStretch;

  TextBtnWidget({required this.name, this.btnColor, this.nameColor, required this.onTap, this.isStretch = true});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isStretch ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isStretch ? 20.0 : 0.0),
          child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: btnColor ?? Theme.of(context).primaryColor,
                  primary: nameColor ?? Colors.black),
              onPressed: onTap,
              child: Text(name)),
        ),
      ],
    );
  }
}
