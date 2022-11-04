import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pocadot_client/screens/suggestions/~graphql/__generated__/suggestions_screen.query.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/utils.dart';
import 'package:pocadot_client/widgets/cards/recommendation_card.dart';
import 'package:pocadot_client/widgets/navigation/app_screen.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';
import 'package:provider/provider.dart';

//#region SUGGESTIONS

class SuggestionsContent extends StatelessWidget {
  const SuggestionsContent({super.key});

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
                artist: e.idols.join(', '),
                release: e.release,
                listingTag: e.type.join('/'),
                onTapped: () {},
                onLeft: () {},
                onRight: () {}))
            .toList();

        return AppinioSwiper(
          cards: suggestionCards,
        );
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
      content: const SuggestionsContent(),
    );
  }
}
//endregion
