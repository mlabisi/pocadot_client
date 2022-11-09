import 'package:event/event.dart';

class SkippedSuggestion extends EventArgs {
  String listingId;
  String collectorId;
  DateTime time;

  SkippedSuggestion(this.listingId, this.collectorId, this.time);
}
