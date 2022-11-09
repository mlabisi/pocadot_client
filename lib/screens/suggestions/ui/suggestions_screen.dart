import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/screens/suggestions/ui/suggestions_content.dart';
import 'package:pocadot_client/screens/suggestions/ui/~graphql/__generated__/user_suggestions.query.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/utils.dart';
import 'package:pocadot_client/widgets/navigation/app_screen.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query$UserSuggestions$Widget(
        builder: (result, {refetch, fetchMore}) {
      final noDataWidget = validateResult(result);
      if (noDataWidget != null) return noDataWidget;

      final suggestions = result.parsedData!.userSuggestions;

      return AppScreen(
        appBar: TabAppBar(
          title: 'Recommendations',
          actions: [
            IconButton(
              icon: const Icon(IconlyLight.filter,
                  color: PocadotColors.primary500),
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
          ],
        ),
        content: SuggestionsContent(
          suggestions: suggestions,
          refresh: refetch!,
        ),
      );
    });
  }
}
