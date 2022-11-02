import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';

class SquareCard extends StatelessWidget {
  final List<Widget> content;
  final Function() onPressed;

  const SquareCard(
      {required this.content,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: FigmaColors.othersWhite,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          child: Wrap(direction: Axis.vertical, children: content),
        );
      }),
    );
  }
}
