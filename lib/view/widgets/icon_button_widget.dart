import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  Color? color;
  Function() onTap;
  IconData? iconData;
  Color? iconColor;

  IconButtonWidget({this.color, required this.onTap, required this.iconData, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 30,
        height: 30,
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black), color: color ?? Theme.of(context).primaryColor),
        child: Icon(
          iconData,
          color: iconColor ?? Colors.black,
        ),
      ),
    );
  }
}
