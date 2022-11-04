import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

//#region SUGGESTIONS
class SuggestionsAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  SuggestionsAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: PocadotColors.greyscale50,
        elevation: 1,
        centerTitle: false,
        title: const Text(
          "Recommendations",
          style: TextStyle(color: PocadotColors.primary500, fontFamily: 'Jua'),
        ),
        actions: [
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
        ]);
  }
}

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
    return Scaffold(
      appBar: SuggestionsAppBar(),
      body: const SuggestionsContent(),
    );
  }
}
//endregion
