import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/cards/bias_choice_card.dart';
import 'package:pocadot_client/widgets/cards/listing_card.dart';
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
                            label: 'Listing Type',
                            initialValue: 'WTS/WTT'),
                        artist: context.knobs.text(
                            label: 'Artist Name',
                            initialValue: 'Nayeon'),
                        release: context.knobs.text(
                            label: 'Release Name',
                            initialValue: 'IM NAYEON'),
                        username: context.knobs.text(
                            label: 'Username',
                            initialValue: 'papagowon'),
                        onPressed: () => () {})),
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
            primaryColor: PocadotColors.primary500,
          ),
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
