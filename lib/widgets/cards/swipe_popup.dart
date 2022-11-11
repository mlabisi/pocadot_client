import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';

class SwipePopup {
  static Flushbar createSwipeRightPopup({required BoxConstraints constraints}) {
    return Flushbar(
      messageText: const Text(
        "Saved!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: PocadotColors.othersWhite,
          fontSize: 16,
          fontFamily: "Urbanist",
          fontWeight: FontWeight.w700,
        ),
      ),
      duration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.elasticOut,
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.only(top: constraints.minHeight * 0.2),
      isDismissible: false,
      borderRadius: BorderRadius.circular(100),
      backgroundColor: PocadotColors.primary500,
      boxShadows: const [
        BoxShadow(
          color: Color(0x3f4353ff),
          blurRadius: 24,
          offset: Offset(4, 8),
        ),
      ],
    );
  }

  static Flushbar createSwipeLeftPopup({required BoxConstraints constraints}) {
    return Flushbar(
      messageText: const Text(
        "Not Interested!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: PocadotColors.othersWhite,
          fontSize: 16,
          fontFamily: "Urbanist",
          fontWeight: FontWeight.w700,
        ),
      ),
      duration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.elasticOut,
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.only(top: constraints.minHeight * 0.5),
      isDismissible: false,
      borderRadius: BorderRadius.circular(100),
      backgroundColor: PocadotColors.alertsStatusError,
      boxShadows: const [
        BoxShadow(
          color: Color(0x3f4353ff),
          blurRadius: 24,
          offset: Offset(4, 8),
        ),
      ],
    );
  }
}
