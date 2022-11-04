import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';

class TabAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  @override
  final Size preferredSize;

  TabAppBar({Key? key, required this.title, this.actions})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PocadotColors.greyscale50,
      elevation: 1,
      centerTitle: false,
      title: Text(
        title,
        style:
            const TextStyle(color: PocadotColors.primary500, fontFamily: 'Jua'),
      ),
      actions: (actions?.isNotEmpty ?? false) ? actions : [],
    );
  }
}
