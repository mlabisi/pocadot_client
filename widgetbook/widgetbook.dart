import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/cards/bias_choice_card.dart';
import 'package:pocadot_client/widgets/cards/listing_card.dart';
import 'package:pocadot_client/widgets/cards/recommendation_card.dart';
import 'package:pocadot_client/widgets/common/search_bar.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';
import 'package:pocadot_client/widgets/offers/offer_chat_bubble.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'Widgets',
          widgets: [
            WidgetbookComponent(
              name: 'card',
              useCases: [
                WidgetbookUseCase(
                    name: 'Bias Choice Card',
                    builder: (context) => BiasChoiceCard(
                        label: context.knobs
                            .text(label: 'Card Title', initialValue: 'STAYC'),
                        imagePath: context.knobs.text(
                            label: 'Image Path',
                            initialValue: 'assets/demo/stayc.png'),
                        onPressed: () => () {})),
                WidgetbookUseCase(
                    name: 'Listing Card',
                    builder: (context) => ListingCard(
                        featuredImage: context.knobs.text(
                            label: 'Featured Image Path',
                            initialValue: 'assets/demo/nayeon.png'),
                        avatarImage: context.knobs.text(
                            label: 'Avatar Image Path',
                            initialValue: 'assets/demo/papagowon.png'),
                        listingTag: context.knobs.text(
                            label: 'Listing Type', initialValue: 'WTS/WTT'),
                        artist: context.knobs
                            .text(label: 'Artist Name', initialValue: 'Nayeon'),
                        release: context.knobs.text(
                            label: 'Release Name', initialValue: 'IM NAYEON'),
                        username: context.knobs
                            .text(label: 'Username', initialValue: 'papagowon'),
                        onPressed: () => () {})),
                WidgetbookUseCase(
                  name: 'Recommendation Card',
                  builder: (context) => RecommendationCard(
                      imagePath: context.knobs.text(
                          label: 'Featured Image Path',
                          initialValue: 'assets/demo/nayeon.png'),
                      artist: context.knobs
                          .text(label: 'Artist Name', initialValue: 'Nayeon'),
                      release: context.knobs.text(
                          label: 'Release Name', initialValue: 'IM NAYEON'),
                      listingTag: context.knobs
                          .text(label: 'Listing Tag', initialValue: 'WTS/WTT'),
                      onTapped: () => () {},
                      onLeft: () => () {},
                      onRight: () => () {}),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'offer',
              useCases: [
                WidgetbookUseCase(
                  name: 'Buy Offer Received',
                  builder: (context) => OfferChatBubble(
                    label: context.knobs.text(
                        label: 'Offer Label',
                        initialValue: 'papagowon wants to buy!'),
                    message: context.knobs.text(
                        label: 'Offer Message',
                        initialValue: 'I\'d love to buy your Momo photocard!'),
                    offerPrice: context.knobs
                        .text(label: 'Offer Price', initialValue: '\$45'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Trade Offer Received',
                  builder: (context) => OfferChatBubble(
                    label: context.knobs.text(
                        label: 'Offer Label',
                        initialValue: 'papagowon wants to trade!'),
                    message: context.knobs.text(
                        label: 'Offer Message',
                        initialValue:
                            'I\'d love to trade you for this Nayeon photocard!'),
                    offerPrice: context.knobs
                        .text(label: 'Offer Price', initialValue: '\$45'),
                    offeredListing: context.knobs.text(
                        label: 'Image Path',
                        initialValue: 'assets/demo/nayeon.png'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Received Offer Edited',
                  builder: (context) => OfferChatBubble(
                    label: context.knobs.text(
                        label: 'Offer Label',
                        initialValue: 'papagowon edited their offer!'),
                    message: context.knobs.text(
                        label: 'Offer Message',
                        initialValue: 'Oops, I meant to offer you \$25'),
                    offerPrice: context.knobs
                        .text(label: 'Offer Price', initialValue: '\$25'),
                    offeredListing: context.knobs.text(
                        label: 'Image Path',
                        initialValue: 'assets/demo/nayeon.png'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Sent Offer Negotiation',
                  builder: (context) => OfferChatBubble(
                    label: context.knobs.text(
                        label: 'Offer Label',
                        initialValue: 'You negotiated papagowon’s offer.'),
                    message: context.knobs.text(
                        label: 'Offer Message',
                        initialValue: 'I don\'t want a nayeon pc or \$25 😬'),
                    offerPrice: context.knobs
                        .text(label: 'Offer Price', initialValue: '\$25'),
                    priceNegotiated: true,
                    offeredListing: context.knobs.text(
                        label: 'Image Path',
                        initialValue: 'assets/demo/nayeon.png'),
                    listingNegotiated: true,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Buy Offer Sent',
                  builder: (context) => OfferChatBubble(
                    label: context.knobs.text(
                        label: 'Offer Label',
                        initialValue: 'You offered to buy!'),
                    message: context.knobs.text(
                        label: 'Offer Message',
                        initialValue: 'I\'d love to buy your Momo photocard!'),
                    offerPrice: context.knobs
                        .text(label: 'Offer Price', initialValue: '\$45'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Trade Offer Sent',
                  builder: (context) => OfferChatBubble(
                    label: context.knobs.text(
                        label: 'Offer Label',
                        initialValue: 'You offered to trade!'),
                    message: context.knobs.text(
                        label: 'Offer Message',
                        initialValue:
                            'I\'d love to trade you for this Nayeon photocard!'),
                    offerPrice: context.knobs
                        .text(label: 'Offer Price', initialValue: '\$45'),
                    offeredListing: context.knobs.text(
                        label: 'Image Path',
                        initialValue: 'assets/demo/nayeon.png'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Sent Offer Edited',
                  builder: (context) => OfferChatBubble(
                    label: context.knobs.text(
                        label: 'Offer Label',
                        initialValue: 'You edited your offer!'),
                    message: context.knobs.text(
                        label: 'Offer Message',
                        initialValue: 'Oops, I meant to offer you \$25'),
                    offerPrice: context.knobs
                        .text(label: 'Offer Price', initialValue: '\$25'),
                    offeredListing: context.knobs.text(
                        label: 'Image Path',
                        initialValue: 'assets/demo/nayeon.png'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Received Offer Negotiation',
                  builder: (context) => OfferChatBubble(
                    label: context.knobs.text(
                        label: 'Offer Label',
                        initialValue: 'foReVe negotiated your offer.'),
                    message: context.knobs.text(
                        label: 'Offer Message',
                        initialValue:
                            'I don\'t want a nayeon pc or \$25 😬Do you have anything else?'),
                    offerPrice: context.knobs
                        .text(label: 'Offer Price', initialValue: '\$25'),
                    priceNegotiated: true,
                    offeredListing: context.knobs.text(
                        label: 'Image Path',
                        initialValue: 'assets/demo/nayeon.png'),
                    listingNegotiated: true,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'navigation',
              useCases: [
                WidgetbookUseCase(
                  name: 'Tab App Bar',
                  builder: (context) => TabAppBar(
                    title: context.knobs.text(
                        label: 'Tab Title', initialValue: 'Recommendations'),
                    actions: [
                      IconButton(
                        icon: const Icon(IconlyLight.filter,
                            color: PocadotColors.primary500),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(IconlyLight.notification,
                            color: PocadotColors.primary500),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Stack App Bar',
                  builder: (context) => StackAppBar(
                    title: context.knobs.text(
                        label: 'Stack Title',
                        initialValue: 'Recommendation Preferences'),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'common',
              useCases: [
                WidgetbookUseCase(
                  name: 'Search Bar',
                  builder: (context) => SearchBar(
                    textController: TextEditingController(),
                    hintText: context.knobs.text(
                        label: "Search Placeholder",
                        initialValue: 'Search for groups and idols'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      appInfo: AppInfo(name: 'pocadot widgetbook'),
      themes: [
        WidgetbookTheme(
          name: 'Custom',
          data: ThemeData(
              primaryColor: PocadotColors.primary500, fontFamily: 'Urbanist'),
        ),
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
    );
  }
}
