import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';

class SquareCard extends StatefulWidget {
  final List<Widget> content;
  final Function() onPressed;

  const SquareCard({required this.content, required this.onPressed, Key? key}) : super(key: key);

  @override
  State<SquareCard> createState() => _SquareCardState();
}

class _SquareCardState extends State<SquareCard> {

  void _onCardTapped() {
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onCardTapped,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: PocadotColors.othersWhite,
            borderRadius: const BorderRadius.all(Radius.circular(22)),
            border: Border.all(
              color: PocadotColors.othersWhite,
              width: 3,
            ),
            boxShadow: const [
              BoxShadow(
                color: PocadotColors.greyscale200,
                blurRadius: 60,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: widget.content),
        );
      }),
    );
  }
}
