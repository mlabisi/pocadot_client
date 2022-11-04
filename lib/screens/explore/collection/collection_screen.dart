import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class CollectionContent extends StatefulWidget {
  const CollectionContent({super.key});

  @override
  State<CollectionContent> createState() =>
      _CollectionContentState();
}

class _CollectionContentState
    extends State<CollectionContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Collection Content',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class CollectionScreen extends HookWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(title: 'Collection Name',),
      body: const CollectionContent(),
    );
  }
}
