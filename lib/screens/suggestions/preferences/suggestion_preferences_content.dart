import 'package:flutter/material.dart';
import 'package:pocadot_client/screens/suggestions/preferences/~graphql/__generated__/suggestion_preferences.fragment.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';

class SuggestionPreferencesContent extends StatefulWidget {
  final Fragment$suggestionPreferences suggestionPreferences;
  final Function refresh;
  final Function fetchMore;

  const SuggestionPreferencesContent({Key? key, required this.suggestionPreferences, required this.refresh, required this.fetchMore}) : super(key: key);

  @override
  State<SuggestionPreferencesContent> createState() => _SuggestionPreferencesContentState();
}

class _SuggestionPreferencesContentState extends State<SuggestionPreferencesContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        SizedBox(
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Personal Preferences",
                  style: TextStyle(
                    color: Color(0xff616161),
                    fontSize: 14,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:const [
                  SizedBox(
                    width: 380,
                    height: 1,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Container(
                      width: 51.11,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0x14a3b0ef),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Container(
                            width: 19.11,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const FlutterLogo(size: 19.114229202270508),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:const [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "My Biases",
                              style: TextStyle(
                                color: Color(0xff212121),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Update your biases to help pocadot make better recommendations!",
                              style: TextStyle(
                                color: Color(0xff616161),
                                fontSize: 16,
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.only(left: 10786, top: 3, bottom: 11, ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Transform.rotate(
                                  angle: -1.57,
                                  child: Container(
                                    width: 13.17,
                                    height: 7.33,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: const Color(0xff212121), width: 1.50, ),
                                      color: const Color(0x7f7f3a44),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Recommendation Preferences",
                  style: TextStyle(
                    color: Color(0xff616161),
                    fontSize: 14,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:const [
                  SizedBox(
                    width: 380,
                    height: 1,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const Expanded(
                            child: SizedBox(
                              child: Text(
                                "Only show me listings that feature one of my biases",
                                style: TextStyle(
                                  color: Color(0xff212121),
                                  fontSize: 16,
                                  fontFamily: "Urbanist",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 44,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: const Color(0xffeeeeee),
                            ),
                            padding: const EdgeInsets.only(right: 20, ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const FlutterLogo(size: 24),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
