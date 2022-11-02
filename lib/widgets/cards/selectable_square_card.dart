import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';

class SelectableSquareCard extends StatefulWidget {
  final List<Widget> content;
  final Function() onPressed;

  const SelectableSquareCard({required this.content, required this.onPressed, Key? key}) : super(key: key);

  @override
  State<SelectableSquareCard> createState() => _SquareCardState();
}

class _SquareCardState extends State<SelectableSquareCard> {
  bool _isSelected = false;

  void _onCardTapped() {
    setState(() {
      _isSelected = !_isSelected;
    });

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
              color: _isSelected ? PocadotColors.primary500 : PocadotColors.othersWhite,
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
          child: Wrap(direction: Axis.vertical, children: widget.content),
        );
      }),
    );
  }
}
