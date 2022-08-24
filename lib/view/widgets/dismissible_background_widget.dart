import 'package:flutter/material.dart';

class DismissibleBackgroundWidget extends StatelessWidget {
  IconData icon;
  Color iconColor;
  Color backgroundColor;
  AlignmentGeometry alignment;
  DismissibleBackgroundWidget({required this.icon, required this.backgroundColor, required this.alignment, this.iconColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: EdgeInsets.only(left: alignment == Alignment.centerRight ? 10 : 0, right: alignment == Alignment.centerLeft ? 10 : 0, top: 20, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(alignment == Alignment.centerRight ? 10 : 0),
            topLeft: Radius.circular(alignment == Alignment.centerRight ? 10 : 0),
            bottomRight: Radius.circular(alignment == Alignment.centerLeft ? 10 : 0),
            topRight: Radius.circular(alignment == Alignment.centerLeft ? 10 : 0),
          ),
          color: Colors.white),
      child: IntrinsicWidth(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            alignment == Alignment.centerRight ? Spacer() : SizedBox(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: backgroundColor),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
            alignment == Alignment.centerLeft ? Spacer() : SizedBox(),
          ],
        ),
      ),
    );
  }
}
