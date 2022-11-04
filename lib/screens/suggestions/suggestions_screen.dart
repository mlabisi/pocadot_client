import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/widgets/navigation/app_screen.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';

//#region SUGGESTIONS
class SuggestionsContent extends StatefulWidget {
  const SuggestionsContent({super.key});

  @override
  State<SuggestionsContent> createState() => _SuggestionsContentState();
}

class _SuggestionsContentState extends State<SuggestionsContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recommendations',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      appBar: TabAppBar(title: 'Recommendations', actions: [
        IconButton(
          icon: const Icon(IconlyLight.filter, color: PocadotColors.primary500),
          onPressed: () {
            Navigator.pushNamed(context, '/suggestion-preferences');
          },
        ),
        IconButton(
          icon: const Icon(IconlyLight.notification,
              color: PocadotColors.primary500),
          onPressed: () {
            Navigator.pushNamed(context, '/notifications');
          },
        )
      ],),
      content: const SuggestionsContent(),
    );
  }
}
//endregion
