import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class FilterResultsContent extends StatefulWidget {
  const FilterResultsContent({super.key});

  @override
  State<FilterResultsContent> createState() =>
      _FilterResultsContentState();
}

class _FilterResultsContentState
    extends State<FilterResultsContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Filter Results',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class FilterResultsScreen extends HookWidget {
  const FilterResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(title: 'Filter Results', backIcon: Icons.close),
      body: const FilterResultsContent(),
    );
  }
}
