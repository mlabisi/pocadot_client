import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class ViewListingContent extends StatefulWidget {
  const ViewListingContent({super.key});

  @override
  State<ViewListingContent> createState() => _ViewListingContentState();
}

class _ViewListingContentState extends State<ViewListingContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('View Listing',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class ViewListingScreen extends HookWidget {
  const ViewListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(
        title: '',
        actions: [
          IconButton(
            icon:
                const Icon(IconlyLight.heart, color: PocadotColors.primary500),
            onPressed: () {},
          )
        ],
      ),
      body: const ViewListingContent(),
    );
  }
}
