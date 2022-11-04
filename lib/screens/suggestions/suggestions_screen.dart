import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pocadot_client/screens/suggestions/suggestions_provider.dart';
import 'package:pocadot_client/screens/suggestions/~graphql/__generated__/suggestions_screen.query.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/utils.dart';
import 'package:pocadot_client/widgets/cards/recommendation_card.dart';
import 'package:pocadot_client/widgets/navigation/app_screen.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';
import 'package:provider/provider.dart';

//#region SUGGESTIONS
class SuggestionsContent extends StatefulWidget {
  final List<RecommendationCard> suggestionCards;

  const SuggestionsContent({super.key, required this.suggestionCards});

  @override
  State<SuggestionsContent> createState() => _SuggestionsContentState();
}

class _SuggestionsContentState extends State<SuggestionsContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppinioSwiper(
        cards: widget.suggestionCards,
    );
  }
}

class SuggestionsScreen extends HookWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final suggestionsQuery = useQuery$SuggestionsScreen(
        Options$Query$SuggestionsScreen(
            variables: Variables$Query$SuggestionsScreen(id: '')));
    final result = suggestionsQuery.result;
    final noDataWidget = validateResult(result);

    if (noDataWidget != null) return noDataWidget;

    final data = result.parsedData!;

    final suggestionCards = data.userSuggestions.map((e) => RecommendationCard(
        imagePath: 'assets/demo/nayeon.png',
        artist: e.idols.join(', '),
        release: e.release,
        listingTag: e.type.join('/'),
        onTapped: () {},
        onLeft: () {},
        onRight: () {})).toList();

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
        suggestionCards: suggestionCards,
      ),
    );
  }
}
//endregion
