import 'package:flutter/material.dart';

class MyBoxWidget extends StatelessWidget {
  final double? height;

  MyBoxWidget({this.height = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
