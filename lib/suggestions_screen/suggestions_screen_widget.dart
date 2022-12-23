import '../components/listing_tag_widget.dart';
import '../components/notifications_button_widget.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    swipeableStackController = SwipeableCardSectionController();
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
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Align(
            alignment: AlignmentDirectional(0, -0.75),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 80),
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
                    () => InkWell(
                          onTap: () async {
                            context.pushNamed('ViewListingScreen');
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            'https://media.karousell.com/media/photos/products/2022/7/12/wtb_im_nayeon_pop_ver_rainbow__1657668775_9fcbc9b9_progressive.jpg',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 0),
                                          child: Text(
                                            'Nayeon',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                        ),
                                        Text(
                                          'IM NAYEON',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Urbanist',
                                                fontSize: 12,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 0),
                                          child: ListingTagWidget(),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                    FlutterFlowTheme.of(context)
                                                        .alertRed,
                                                icon: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
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
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                icon: Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    () => InkWell(
                          onTap: () async {
                            context.pushNamed('ViewListingScreen');
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            'https://media.karousell.com/media/photos/products/2022/7/12/wtb_im_nayeon_pop_ver_rainbow__1657668775_9fcbc9b9_progressive.jpg',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 0),
                                          child: Text(
                                            'Nayeon',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                        ),
                                        Text(
                                          'IM NAYEON',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Urbanist',
                                                fontSize: 12,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 0),
                                          child: ListingTagWidget(),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                    FlutterFlowTheme.of(context)
                                                        .alertRed,
                                                icon: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
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
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                icon: Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    () => InkWell(
                          onTap: () async {
                            context.pushNamed('ViewListingScreen');
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            'https://media.karousell.com/media/photos/products/2022/7/12/wtb_im_nayeon_pop_ver_rainbow__1657668775_9fcbc9b9_progressive.jpg',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 0),
                                          child: Text(
                                            'Nayeon',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                        ),
                                        Text(
                                          'IM NAYEON',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Urbanist',
                                                fontSize: 12,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 0),
                                          child: ListingTagWidget(),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                    FlutterFlowTheme.of(context)
                                                        .alertRed,
                                                icon: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
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
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                icon: Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
