import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class MakeOfferContent extends StatefulWidget {
  const MakeOfferContent({super.key});

  @override
  State<MakeOfferContent> createState() => _MakeOfferContentState();
}

class _MakeOfferContentState extends State<MakeOfferContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Make Offer',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class MakeOfferScreen extends HookWidget {
  const MakeOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(
        title: 'Make an Offer',
        backIcon: Icons.close,
      ),
      body: const MakeOfferContent(),
    );
  }
}
