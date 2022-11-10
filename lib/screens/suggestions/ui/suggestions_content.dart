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
  final Function fetchMore;

  const SuggestionsContent(
      {Key? key,
      required this.suggestions,
      required this.refresh,
      required this.fetchMore})
      : super(key: key);

  @override
  State<SuggestionsContent> createState() => _SuggestionsContentState();
}

class _SuggestionsContentState extends State<SuggestionsContent> {
  late SwiperController _swiperController;
  final List<Widget?> _suggestionCards = [];

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _swiperController = SwiperController();
    super.initState();
  }

  List<Widget?> getSuggestions() {
    return widget.suggestions.map((e) {
      return e.id ==
              'DONE' // if suggestion id is "done", then return the notice
          ? Center(
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
                          widget.refresh();
                        },
                        child: const Text(
                          'Refresh',
                          style: TextStyle(color: PocadotColors.othersWhite),
                        )))
              ],
            ))
          : RecommendationCard(
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
                tappedSuggestion
                    .broadcast(ViewedSuggestion(e.id, '', DateTime.now()));

                // navigate to view listing screen
              },
              controller: _swiperController,
            );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> seen = [];
    final List<String> skipped = [];
    final List<String> saved = [];

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Swiper(
            unlimitedUnswipe: true,
            verticalSwipeEnabled: false,
            cards: getSuggestions(),
            controller: _swiperController,
            onSwipe: (RecommendationCard? swiped, SwiperDirection direction) {
              if (direction == SwiperDirection.left) {
                var swipedLeft = Event<SkippedSuggestion>();
                swipedLeft.broadcast(
                    SkippedSuggestion(swiped!.id, '', DateTime.now()));
                skipped.add(swiped.id);
              } else {
                var swipedRight = Event<SavedSuggestion>();
                swipedRight
                    .broadcast(SavedSuggestion(swiped!.id, '', DateTime.now()));
                saved.add(swiped.id);
              }

              seen.add(swiped.id ?? '');
            },
            onEnd: () {
              widget.refresh();

              // widget.fetchMore(
              //   (prev, more) {
              //     final List<dynamic> items = <dynamic>[
              //       ...prev?["userSuggestions"] as List<dynamic>? ??
              //           <dynamic>[],
              //       ...more?["userSuggestions"] as List<dynamic>? ??
              //           <dynamic>[],
              //     ];
              //
              //     more?["userSuggestions"] = items;
              //     return more ?? <String, dynamic>{};
              //   },
              // );
            },
            padding: EdgeInsets.only(
                left: (constraints.widthConstraints().maxWidth * 0.125),
                top: (constraints.widthConstraints().maxWidth * 0.125)),
          )
        ],
      );
    });
  }
}
