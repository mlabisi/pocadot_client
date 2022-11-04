import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';

class StackAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  @override
  final Size preferredSize;

  StackAppBar({Key? key, required this.title, this.actions})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: PocadotColors.greyscale50,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: PocadotColors.primary500),
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: const TextStyle(color: PocadotColors.primary500, fontFamily: 'Jua'),
        ),
      actions: (actions?.isNotEmpty ?? false) ? actions : [],
    );
  }
}
