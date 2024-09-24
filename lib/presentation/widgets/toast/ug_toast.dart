import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

class UGToast {
  static Future<bool?> show({
    ToastGravity? toastGravity,
    Color? textColor,
    Color? backgroundColor,
    String? message,
    double? fontSize,
  }) {
    return Fluttertoast.showToast(
        fontSize: fontSize,
        textColor: textColor,
        backgroundColor: backgroundColor,
        gravity: toastGravity,
        msg: message ?? '');
  }
}
