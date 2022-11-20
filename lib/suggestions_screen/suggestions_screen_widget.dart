import '../components/suggestion_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Suggestions',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Jua',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 22,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 40,
            icon: Icon(
              FFIcons.kfilter,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 25,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 40,
            icon: Icon(
              FFIcons.knotification,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 25,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 90),
            child: FlutterFlowSwipeableStack(
              topCardHeightFraction: 0.77,
              middleCardHeightFraction: 0.68,
              botttomCardHeightFraction: 0.75,
              topCardWidthFraction: 0.9,
              middleCardWidthFraction: 0.85,
              botttomCardWidthFraction: 0.8,
              onSwipeFn: (index) {},
              onLeftSwipe: (index) {},
              onRightSwipe: (index) {},
              onUpSwipe: (index) {},
              onDownSwipe: (index) {},
              itemBuilder: (context, index) {
                return [
                  () => SuggestionCardWidget(),
                  () => SuggestionCardWidget(),
                  () => SuggestionCardWidget(),
                  () => SuggestionCardWidget(),
                ][index]();
              },
              itemCount: 4,
              controller: swipeableStackController,
              enableSwipeUp: false,
              enableSwipeDown: false,
            ),
          ),
        ),
      ),
    );
  }
}
