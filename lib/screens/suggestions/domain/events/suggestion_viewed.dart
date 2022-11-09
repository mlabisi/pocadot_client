import 'package:event/event.dart';

class ViewedSuggestion extends EventArgs {
  String listingId;
  String collectorId;
  DateTime time;

  ViewedSuggestion(this.listingId, this.collectorId, this.time);
}
