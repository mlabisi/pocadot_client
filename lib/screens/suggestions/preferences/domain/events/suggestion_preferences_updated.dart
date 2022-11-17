import 'package:event/event.dart';
import 'package:pocadot_client/screens/suggestions/preferences/~graphql/__generated__/suggestion_preferences.fragment.graphql.dart';

class SuggestionPrefsUpdated extends EventArgs {
  Fragment$suggestionPreferences prefs;
  String collectorId;
  DateTime time;

  SuggestionPrefsUpdated(this.prefs, this.collectorId, this.time);
}
