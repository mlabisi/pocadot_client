import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/square_card.dart';

class BiasChoiceCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final Function() onPressed;

  const BiasChoiceCard(
      {required this.label,
      required this.imagePath,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SquareCard(content: [
          Container(
            width: constraints.widthConstraints().maxWidth * 0.5,
            height: constraints.widthConstraints().maxWidth * 0.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: constraints.widthConstraints().maxWidth * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                      color: FigmaColors.greyscale900,
                      fontSize: 18,
                      fontFamily: 'Jua'),
                ),
              ],
            ),
          )
        ], onPressed: onPressed);
      }
    );
  }
}
