import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class SuggestionPreferencesContent extends StatefulWidget {
  const SuggestionPreferencesContent({super.key});

  @override
  State<SuggestionPreferencesContent> createState() =>
      _SuggestionPreferencesContentState();
}

class _SuggestionPreferencesContentState
    extends State<SuggestionPreferencesContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recommendation Preferences',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class SuggestionPreferencesScreen extends HookWidget {
  const SuggestionPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(title: 'Recommendation Preferences',),
      body: const SuggestionPreferencesContent(),
    );
  }
}
