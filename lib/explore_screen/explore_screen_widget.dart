import '../components/listing_card_widget.dart';
import '../components/notifications_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreenWidget extends StatefulWidget {
  const ExploreScreenWidget({Key? key}) : super(key: key);

  @override
  _ExploreScreenWidgetState createState() => _ExploreScreenWidgetState();
}

class _ExploreScreenWidgetState extends State<ExploreScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Explore',
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
              FFIcons.kplus,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 25,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          NotificationsButtonWidget(),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).greyscale100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.ksearch,
                            color: FlutterFlowTheme.of(context).greyscale400,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Search for groups and idols',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context)
                                        .greyscale400,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Collections',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Jua',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Image.asset(
                            'assets/images/girlGroups.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Image.asset(
                          'assets/images/boyGroups.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Listings',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Jua',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                      Text(
                        'See All',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 96),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      ListingCardWidget(),
                      ListingCardWidget(),
                      ListingCardWidget(),
                      ListingCardWidget(),
                      ListingCardWidget(),
                      ListingCardWidget(),
                      ListingCardWidget(),
                      ListingCardWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
