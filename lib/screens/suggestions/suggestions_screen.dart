import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pocadot_client/graphql/__generated__/schema.graphql.dart';
import 'package:pocadot_client/screens/suggestions/~graphql/__generated__/suggestions_screen.query.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/utils.dart';
import 'package:pocadot_client/widgets/cards/recommendation_card.dart';
import 'package:pocadot_client/widgets/cards/swiper.dart';
import 'package:pocadot_client/widgets/navigation/app_screen.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';

//#region SUGGESTIONS

class SuggestionsContent extends StatefulWidget {
  final SwiperController controller;

  const SuggestionsContent({super.key, required this.controller});

  @override
  State<SuggestionsContent> createState() => _SuggestionsContentState();
}

class _SuggestionsContentState extends State<SuggestionsContent> {
  final double borderRadius = 25;
  final List<String> skipped = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Query$SuggestionsScreen$Widget(
      options: Options$Query$SuggestionsScreen(),
      builder: (result, {fetchMore, refetch}) {
        final noDataWidget = validateResult(result);
        if (noDataWidget != null) return noDataWidget;

        final data = result.parsedData!;

        final suggestionCards = data.userSuggestions
            .map((e) => RecommendationCard(
                  id: e.id,
                  imagePath: 'assets/demo/nayeon.png',
                  artist: e.idols.map((e) => e.name).toList().join(', '),
                  release: e.release,
                  listingTag: e.type
                      .map((e) => toJson$Enum$ListingType(e))
                      .toList()
                      .join('/'),
                  onTapped: () {},
                  controller: widget.controller,
                ))
            .toList();

        return LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      skipped.isNotEmpty
                          ? "Check back later for more recommendations, or click the button below to review your already-seen photocard suggestions!"
                          : "Check back later for more recommendations, or click the button below to see if there are new photocard suggestions available for you!",
                      style: const TextStyle(color: PocadotColors.primary500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              alignment: Alignment.center,
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(
                                      right: 75,
                                      left: 75,
                                      top: 15,
                                      bottom: 15)),
                              backgroundColor: MaterialStateProperty.all(
                                  PocadotColors.primary500),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(borderRadius)),
                              )),
                          onPressed: () {
                            if (skipped.isNotEmpty) {
                              skipped.clear();
                              widget.controller.unswipe();
                            } else {
                              refetch!();
                            }
                          },
                          child: Text(
                            skipped.isEmpty ? 'Restart' : 'Review',
                            style: const TextStyle(
                                color: PocadotColors.othersWhite),
                          )))
                ],
              )),
              Swiper(
                unlimitedUnswipe: true,
                verticalSwipeEnabled: false,
                cards: suggestionCards,
                controller: widget.controller,
                onSwipe:
                    (RecommendationCard? swiped, SwiperDirection direction) {
                  if (direction == SwiperDirection.left) {
                    skipped.add(swiped?.id ?? '');
                  }
                },
                padding: EdgeInsets.only(
                    left: (constraints.widthConstraints().maxWidth * 0.125),
                    top: (constraints.widthConstraints().maxWidth * 0.125)),
              )
            ],
          );
        });
      },
    );
  }
}

class SuggestionsScreen extends HookWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      appBar: TabAppBar(
        title: 'Recommendations',
        actions: [
          IconButton(
            icon:
                const Icon(IconlyLight.filter, color: PocadotColors.primary500),
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
        controller: SwiperController(),
      ),
    );
  }
}
//endregion
