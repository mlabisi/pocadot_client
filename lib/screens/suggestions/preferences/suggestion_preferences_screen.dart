import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';

class SuggestionPreferencesAppBar extends StatelessWidget
    with PreferredSizeWidget {
  @override
  final Size preferredSize;

  SuggestionPreferencesAppBar({Key? key})
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
          "Recommendation Preferences",
          style: TextStyle(color: PocadotColors.primary500, fontFamily: 'Jua'),
        ));
  }
}

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
      appBar: SuggestionPreferencesAppBar(),
      body: const SuggestionPreferencesContent(),
    );
  }
}
