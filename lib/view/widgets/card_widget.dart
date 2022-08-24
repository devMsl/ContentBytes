import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  double? ml, mr, mt, mb, pl, pr, pt, pb, ma, pa, mh, mv, ph, pv;

  CardWidget(
      {this.child,
      this.ml = 15,
      this.mr = 15,
      this.mb = 15,
      this.mt = 15,
      this.pb = 15,
      this.pt = 15,
      this.pr = 15,
      this.pl = 15,
      this.ma,
      this.pa,
      this.mh,
      this.mv,
      this.ph,
      this.pv,
      this.backgroundColor}) {
    if (this.pa != null) {
      pl = pa;
      pr = pa;
      pb = pa;
      pt = pa;
    }

    if (this.mh != null) {
      ml = mh;
      mr = mh;
    }
    if (this.mv != null) {
      mt = mv;
      mb = mv;
    }
    if (this.ph != null) {
      pl = ph;
      pr = ph;
    }
    if (this.pv != null) {
      pt = pv;
      pb = pv;
    }

    if (this.ma != null) {
      ml = ma;
      mr = ma;
      mb = ma;
      mt = ma;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          right: 10,
          bottom: 10,
          top: 20,
          child: Container(
            decoration:
                BoxDecoration(color: backgroundColor ?? Theme.of(context).backgroundColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).cardColor, border: Border.all(color: Colors.black)),
          margin: EdgeInsets.only(left: ml!, right: mr!, top: mt!, bottom: mb!),
          padding: EdgeInsets.only(left: pl!, right: pr!, top: pt!, bottom: pb!),
          child: child,
        ),
      ],
    );
  }
}
