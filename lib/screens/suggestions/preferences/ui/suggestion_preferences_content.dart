import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/screens/suggestions/preferences/ui/~graphql/__generated__/suggestion_preferences.fragment.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/theme/icons.dart';

class SuggestionPreferencesContent extends StatefulWidget {
  final Fragment$suggestionPreferences suggestionPreferences;
  final Function refresh;
  final Function fetchMore;

  const SuggestionPreferencesContent(
      {Key? key,
      required this.suggestionPreferences,
      required this.refresh,
      required this.fetchMore})
      : super(key: key);

  @override
  State<SuggestionPreferencesContent> createState() =>
      _SuggestionPreferencesContentState();
}

class _SuggestionPreferencesContentState
    extends State<SuggestionPreferencesContent> {
  late bool _biasesOnly;

  void toggleSwitch() {
    setState(() {
      _biasesOnly = !_biasesOnly;

      // TODO execute mutation to update value
    });
  }

  @override
  void initState() {
    _biasesOnly = widget.suggestionPreferences.biasSuggestionsOnly;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(left: (16), top: (18), right: (16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Personal Preferences",
                style: TextStyle(
                  color: PocadotColors.greyscale700,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(height: 16),
            const Divider(
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: PocadotColors.greyscale200),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => {},
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                          color: PocadotColors.transparentBlue,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          String.fromCharCode(
                              PocadotIcons.fingerHeart.codePoint),
                          style: TextStyle(
                              inherit: false,
                              color: PocadotColors.primary500,
                              fontSize: 32.0,
                              fontWeight: FontWeight.w900,
                              fontFamily: PocadotIcons.fingerHeart.fontFamily,
                              package: PocadotIcons.fingerHeart.fontPackage),
                        ),
                      )),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "My Biases",
                            style: TextStyle(
                                color: PocadotColors.greyscale900,
                                fontSize: 18,
                                fontFamily: 'Jua'),
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Update your biases to help pocadot make better recommendations!",
                            style: TextStyle(
                              color: PocadotColors.greyscale700,
                              fontSize: 16,
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    IconlyLight.arrow_right_2,
                    color: PocadotColors.greyscale900,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text("Recommendation Preferences",
                style: TextStyle(
                  color: PocadotColors.greyscale700,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(height: 16),
            const Divider(
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: PocadotColors.greyscale200),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      "Only show me listings that feature one of my biases",
                      style: TextStyle(
                        color: PocadotColors.greyscale900,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Switch(
                      value: _biasesOnly,
                      activeColor: PocadotColors.primary500,
                      onChanged: (value) => toggleSwitch())
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
