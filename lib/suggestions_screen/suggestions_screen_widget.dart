import '../components/notifications_button_widget.dart';
import '../components/suggestion_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class SuggestionsScreenWidget extends StatefulWidget {
  const SuggestionsScreenWidget({Key? key}) : super(key: key);

  @override
  _SuggestionsScreenWidgetState createState() =>
      _SuggestionsScreenWidgetState();
}

class _SuggestionsScreenWidgetState extends State<SuggestionsScreenWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    swipeableStackController = SwipeableCardSectionController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Suggestions',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 22,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              FFIcons.kfilter,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () async {
              context.pushNamed('SuggestionPreferences');
            },
          ),
          NotificationsButtonWidget(),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Align(
            alignment: AlignmentDirectional(0, -0.75),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 104),
              child: FlutterFlowSwipeableStack(
                topCardHeightFraction: 0.74,
                middleCardHeightFraction: 0.7,
                bottomCardHeightFraction: 0.7,
                topCardWidthFraction: 0.9,
                middleCardWidthFraction: 0.85,
                bottomCardWidthFraction: 0.8,
                onSwipeFn: (index) {},
                onLeftSwipe: (index) {},
                onRightSwipe: (index) {},
                onUpSwipe: (index) {},
                onDownSwipe: (index) {},
                itemBuilder: (context, index) {
                  return [
                    () => Stack(
                          children: [
                            SuggestionCardWidget(),
                            Align(
                              alignment: AlignmentDirectional(0, 0.95),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 30,
                                      fillColor:
                                          FlutterFlowTheme.of(context).alertRed,
                                      icon: Icon(
                                        Icons.close,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        size: 12,
                                      ),
                                      onPressed: () async {
                                        swipeableStackController
                                            .triggerSwipeLeft();
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 30,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      icon: Icon(
                                        Icons.favorite_border_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        size: 12,
                                      ),
                                      onPressed: () async {
                                        swipeableStackController
                                            .triggerSwipeRight();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    () => Stack(
                          children: [
                            SuggestionCardWidget(),
                            Align(
                              alignment: AlignmentDirectional(0, 0.95),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 30,
                                      fillColor:
                                          FlutterFlowTheme.of(context).alertRed,
                                      icon: Icon(
                                        Icons.close,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        size: 12,
                                      ),
                                      onPressed: () async {
                                        swipeableStackController
                                            .triggerSwipeLeft();
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 30,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      icon: Icon(
                                        Icons.favorite_border_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        size: 12,
                                      ),
                                      onPressed: () async {
                                        swipeableStackController
                                            .triggerSwipeRight();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    () => Stack(
                          children: [
                            SuggestionCardWidget(),
                            Align(
                              alignment: AlignmentDirectional(0, 0.95),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 30,
                                      fillColor:
                                          FlutterFlowTheme.of(context).alertRed,
                                      icon: Icon(
                                        Icons.close,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        size: 12,
                                      ),
                                      onPressed: () async {
                                        swipeableStackController
                                            .triggerSwipeLeft();
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 30,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      icon: Icon(
                                        Icons.favorite_border_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        size: 12,
                                      ),
                                      onPressed: () async {
                                        swipeableStackController
                                            .triggerSwipeRight();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                  ][index]();
                },
                itemCount: 3,
                controller: swipeableStackController,
                enableSwipeUp: false,
                enableSwipeDown: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
