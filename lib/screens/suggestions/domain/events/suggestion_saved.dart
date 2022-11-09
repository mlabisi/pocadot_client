import 'package:event/event.dart';

class SavedSuggestion extends EventArgs {
  String listingId;
  String collectorId;
  DateTime time;

  SavedSuggestion(this.listingId, this.collectorId, this.time);
}
