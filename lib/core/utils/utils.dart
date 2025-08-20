import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';

enum SnackBarType { success, error }

void showAppSnackbar({
  required BuildContext context,
  required SnackBarType type,
  required String description,
}) {
  switch (type) {
    case SnackBarType.success:
      CherryToast.success(
        animationType: AnimationType.fromTop,
        description: Text(description),
      ).show(context);
      break;
    case SnackBarType.error:
      CherryToast.error(
        animationType: AnimationType.fromTop,
        description: Text(description),
      ).show(context);
      break;
  }
}
