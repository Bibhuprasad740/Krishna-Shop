import 'package:flutter/material.dart';

import './stock_colors.dart';

class Utils {
  static Size getScreenSize(BuildContext context) {
    return MediaQueryData.fromView(View.of(context)).size;
  }

  static void showSnackBar({
    required BuildContext context,
    required String message,
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? SC.error : SC.accent1,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.endToStart,
        elevation: 8,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: SC.accent2,
          ),
        ),
      ),
    );
  }
}
