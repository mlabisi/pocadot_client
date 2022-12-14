import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class AddListingContent extends StatefulWidget {
  const AddListingContent({super.key});

  @override
  State<AddListingContent> createState() =>
      _AddListingContentState();
}

class _AddListingContentState
    extends State<AddListingContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Add Listing',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class AddListingScreen extends HookWidget {
  const AddListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(title: 'Add Listing', backIcon: Icons.cancel,),
      body: const AddListingContent(),
    );
  }
}
