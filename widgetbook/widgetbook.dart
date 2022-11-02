import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/bias_choice_card.dart';
import 'package:pocadot_client/widgets/square_card.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
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
            primaryColor: FigmaColors.primary500,
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
