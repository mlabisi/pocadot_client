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

class SuggestionsContent extends StatelessWidget {
  final double borderRadius = 25;
  final SwiperController controller;

  const SuggestionsContent({super.key, required this.controller});

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
                  imagePath: 'assets/demo/nayeon.png',
                  artist: e.idols.map((e) => e.name).toList().join(', '),
                  release: e.release,
                  listingTag: e.type
                      .map((e) => toJson$Enum$ListingType(e))
                      .toList()
                      .join('/'),
                  onTapped: () {},
                  controller: controller,
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
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Check back later for more recommendations, or click the button below to review your already-seen photocard suggestions!',
                      style: TextStyle(color: PocadotColors.primary500),
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
                            controller.unswipe();
                          },
                          child: const Text(
                            'Review',
                            style: TextStyle(color: PocadotColors.othersWhite),
                          )))
                ],
              )),
              Swiper(
                unlimitedUnswipe: true,
                verticalSwipeEnabled: false,
                cards: suggestionCards,
                controller: controller,
                onSwipe: (_, __) {},
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
