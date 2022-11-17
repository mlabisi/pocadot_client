import 'package:flutter/material.dart';
import 'package:pocadot_client/screens/suggestions/preferences/ui/suggestion_preferences_content.dart';
import 'package:pocadot_client/screens/suggestions/preferences/~graphql/__generated__/suggestion_preferences_screen.query.graphql.dart';
import 'package:pocadot_client/utils.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class SuggestionPreferencesScreen extends StatelessWidget {
  const SuggestionPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Query$SuggestionPreferencesScreen$Widget(
        builder: (result, {refetch, fetchMore}) {
      final noDataWidget = validateResult(result);
      if (noDataWidget != null) return noDataWidget;

      final suggestionPreferences = result.parsedData!.currentUser;

      return Scaffold(
        appBar: StackAppBar(
          title: 'Recommendation Preferences',
        ),
        body: SuggestionPreferencesContent(
          suggestionPreferences: suggestionPreferences,
          refresh: refetch!,
          fetchMore: fetchMore!,
        ),
      );
    });
  }
}
