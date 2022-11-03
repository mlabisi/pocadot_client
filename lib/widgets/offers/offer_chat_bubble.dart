import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';

class OfferChatBubble extends StatelessWidget {
  const OfferChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.widthConstraints().maxWidth * 0.75,
        height: constraints.widthConstraints().maxWidth * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: PocadotColors.primary500,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: PocadotColors.greyscale200,
              blurRadius: 60,
              offset: Offset(0, 4),
            ),
          ],
          color: PocadotColors.backgroundBlue,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "papagowon wants to trade!",
              style: TextStyle(
                color: Color(0xff212121),
                fontSize: 18,
                fontFamily: 'Jua'
              ),
            ),
            const Expanded(child: Spacer()),
            Text(
              "“Oops I meant to offer you \$25”",
              style: TextStyle(
                color: PocadotColors.greyscale800,
                fontSize: 14,
                fontFamily: "Urbanist",
                fontWeight: FontWeight.w500,
              ),
            ),
            const Expanded(child: Spacer()),
            Divider(
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: PocadotColors.primary500),
            Expanded(child: Spacer()),
          ],
        ),
      );
    });
  }
}
