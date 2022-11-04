import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';

class NotificationsAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  NotificationsAppBar({Key? key})
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
        title: const Text(
          "Notifications",
          style: TextStyle(color: PocadotColors.primary500, fontFamily: 'Jua'),
        ));
  }
}

class NotificationsContent extends StatefulWidget {
  const NotificationsContent({super.key});

  @override
  State<NotificationsContent> createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifications',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationsAppBar(),
      body: const NotificationsContent(),
    );
  }
}
