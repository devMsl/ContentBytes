import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future<T?> to<T extends Object>(Widget widget, {bool fullscreenDialog = false}) async {
    return await Navigator.of(this).push<T>(MaterialPageRoute(
        builder: (BuildContext context) {
          return widget;
        },
        fullscreenDialog: fullscreenDialog));
  }

  void back<T extends Object>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  Future<T?> offAll<T extends Object>(Widget widget) async {
    return await Navigator.of(this).pushAndRemoveUntil<T>(MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }), (route) => false);
  }
}
