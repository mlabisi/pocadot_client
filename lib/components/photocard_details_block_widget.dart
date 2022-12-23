import '../components/photocard_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhotocardDetailsBlockWidget extends StatefulWidget {
  const PhotocardDetailsBlockWidget({Key? key}) : super(key: key);

  @override
  _PhotocardDetailsBlockWidgetState createState() =>
      _PhotocardDetailsBlockWidgetState();
}

class _PhotocardDetailsBlockWidgetState
    extends State<PhotocardDetailsBlockWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: FlutterFlowTheme.of(context).greyscale200,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 4),
                    child: Text(
                      'Photocard Details',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              indent: 16,
              endIndent: 16,
              color: FlutterFlowTheme.of(context).greyscale200,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height: 85,
                                  child: PhotocardDetailsWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://pocadot.b-cdn.net/recTLCAdgnX8FQU6e.png',
                            width: MediaQuery.of(context).size.width * 0.16,
                            height: MediaQuery.of(context).size.height * 0.12,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.85,
                                          child: PhotocardDetailsWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Broadcast (1/3)',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'I love (2022) | (G)I-DLE',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 4),
                                    child: Text(
                                      'You don\'t own this photocard!',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Shown if user does not have this photocard in their collection
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Add to Wishlist',
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),

                                      // Shown if the user does not have this photocard in their collection. Removes from wishlist when pressed.
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Add to My Collection',
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 4),
                                      child: Text(
                                        'You own this photocard!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Shown if user has this photocard in their collection
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'List Photocard',
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),

                                        // Shown if the user does not have this photocard in their collection. Removes from wishlist when pressed.
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Remove from My Collection',
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 4),
                                      child: Text(
                                        'You listed this photocard!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Shown if user has this photocard in their collection
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'View Listing',
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 4),
                                      child: Text(
                                        'This photocard is in your wishlist!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Shown if user does not have this photocard in their collection
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Remove from Wishlist',
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),

                                        // Shown if the user does not have this photocard in their collection. Removes from wishlist when pressed.
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Add to My Collection',
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
