import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/screens/explore/search/search_content.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(title: 'Search', actions: [
        IconButton( // TODO: useCallback to hide when there are no results??
          icon: const Icon(IconlyLight.filter, color: PocadotColors.primary500),
          onPressed: () {
            Navigator.pushNamed(context, '/filter-results');
          },
        ),
        IconButton(
          icon: const Icon(IconlyLight.swap, color: PocadotColors.primary500),
          onPressed: () {},
        )
      ]),
      body: const SearchContent(),
    );
  }
}
