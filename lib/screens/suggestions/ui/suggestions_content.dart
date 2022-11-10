import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:pocadot_client/graphql/__generated__/schema.graphql.dart';
import 'package:pocadot_client/screens/suggestions/domain/events/suggestion_saved.dart';
import 'package:pocadot_client/screens/suggestions/domain/events/suggestion_skipped.dart';
import 'package:pocadot_client/screens/suggestions/domain/events/suggestion_viewed.dart';
import 'package:pocadot_client/screens/suggestions/ui/~graphql/__generated__/suggestions.fragment.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/cards/recommendation_card.dart';
import 'package:pocadot_client/widgets/cards/swiper.dart';

class SuggestionsContent extends StatefulWidget {
  final List<Fragment$suggestion> suggestions;
  final Function refresh;

  const SuggestionsContent(
      {Key? key, required this.suggestions, required this.refresh})
      : super(key: key);

  @override
  State<SuggestionsContent> createState() => _SuggestionsContentState();
}

class _SuggestionsContentState extends State<SuggestionsContent> {
  late SwiperController _swiperController;
  late bool _showNotice;

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _showNotice = false;
    _swiperController = SwiperController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> seen = [];
    final List<String> skipped = [];
    final List<String> saved = [];

    final suggestionCards = widget.suggestions
        .map((e) => RecommendationCard(
              id: e.id,
              imagePath: 'assets/demo/nayeon.png',
              artist: e.idols.map((e) => e.name).toList().join(', '),
              release: e.release,
              listingTag: e.type
                  .map((e) => toJson$Enum$ListingType(e))
                  .toList()
                  .join('/'),
              onTapped: () {
                var tappedSuggestion = Event<ViewedSuggestion>();
                tappedSuggestion.broadcast(ViewedSuggestion(e.id, '', DateTime.now()));

                // navigate to view listing screen
              },
              controller: _swiperController,
            ))
        .toList();

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Visibility(
            visible: _showNotice,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Check back later for more recommendations, or click the button below to see if there are new photocard suggestions available for you!",
                    style: TextStyle(color: PocadotColors.primary500),
                    textAlign: TextAlign.center,
                  ),
                ),
                DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            alignment: Alignment.center,
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(
                                    right: 75, left: 75, top: 15, bottom: 15)),
                            backgroundColor: MaterialStateProperty.all(
                                PocadotColors.primary500),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                            )),
                        onPressed: () {
                          _showNotice = false;
                          widget.refresh();
                        },
                        child: const Text(
                          'Refresh',
                          style: TextStyle(color: PocadotColors.othersWhite),
                        )))
              ],
            )),
          ),
          Visibility(
            visible: !_showNotice,
            child: Swiper(
              unlimitedUnswipe: true,
              verticalSwipeEnabled: false,
              cards: suggestionCards,
              controller: _swiperController,
              onSwipe: (RecommendationCard? swiped, SwiperDirection direction) {
                if (direction == SwiperDirection.left) {
                  var swipedLeft = Event<SkippedSuggestion>();
                  swipedLeft.broadcast(SkippedSuggestion(swiped!.id, '', DateTime.now()));
                  skipped.add(swiped.id);
                } else {
                  var swipedRight = Event<SavedSuggestion>();
                  swipedRight.broadcast(SavedSuggestion(swiped!.id, '', DateTime.now()));
                  saved.add(swiped.id);
                }

                seen.add(swiped.id ?? '');
              },
              onEnd: () {
                setState(() {
                  _showNotice = true;
                  _swiperController = _swiperController;
                });
              },
              onLast: () {
                widget.refresh();
              },
              padding: EdgeInsets.only(
                  left: (constraints.widthConstraints().maxWidth * 0.125),
                  top: (constraints.widthConstraints().maxWidth * 0.125)),
            ),
          )
        ],
      );
    });
  }
}
