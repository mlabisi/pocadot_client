import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterPhotocardsWidget extends StatefulWidget {
  const FilterPhotocardsWidget({Key? key}) : super(key: key);

  @override
  _FilterPhotocardsWidgetState createState() => _FilterPhotocardsWidgetState();
}

class _FilterPhotocardsWidgetState extends State<FilterPhotocardsWidget> {
  List<String>? checkboxGroupValues1;
  List<String>? checkboxGroupValues2;
  List<String>? checkboxGroupValues3;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).greyscale200,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Container(
                              width: double.infinity,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              child: ExpandableNotifier(
                                initialExpanded: true,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Text(
                                      'Type',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Divider(
                                        thickness: 1,
                                        color: FlutterFlowTheme.of(context)
                                            .greyscale200,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: FlutterFlowCheckboxGroup(
                                          options: [
                                            'Album Inclusion',
                                            'Preorder Benefit',
                                            'Broadcast',
                                            'Merchandise',
                                            'Event Merchandise',
                                            'Fansign Winner',
                                            'Event Winner',
                                            'Polaroid',
                                            'Package Inclusion'
                                          ],
                                          onChanged: (val) => setState(
                                              () => checkboxGroupValues1 = val),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          checkColor: Colors.white,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1,
                                          checkboxBorderRadius:
                                              BorderRadius.circular(6),
                                          initialized:
                                              checkboxGroupValues1 != null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).greyscale200,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Container(
                              width: double.infinity,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              child: ExpandableNotifier(
                                initialExpanded: true,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Text(
                                      'Special',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Divider(
                                        thickness: 1,
                                        color: FlutterFlowTheme.of(context)
                                            .greyscale200,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: FlutterFlowCheckboxGroup(
                                          options: [
                                            'Limited Edition',
                                            'Fansign Winner',
                                            'Event Winner',
                                            'Lucky Draw'
                                          ],
                                          onChanged: (val) => setState(
                                              () => checkboxGroupValues2 = val),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          checkColor: Colors.white,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1,
                                          checkboxBorderRadius:
                                              BorderRadius.circular(6),
                                          initialized:
                                              checkboxGroupValues2 != null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).greyscale200,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Container(
                              width: double.infinity,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              child: ExpandableNotifier(
                                initialExpanded: true,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Text(
                                      'Unit Cards',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Divider(
                                        thickness: 1,
                                        color: FlutterFlowTheme.of(context)
                                            .greyscale200,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: FlutterFlowCheckboxGroup(
                                          options: ['Show Unit Photocards'],
                                          onChanged: (val) => setState(
                                              () => checkboxGroupValues3 = val),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          checkColor: Colors.white,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1,
                                          checkboxBorderRadius:
                                              BorderRadius.circular(6),
                                          initialized:
                                              checkboxGroupValues3 != null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Stack(
                    alignment: AlignmentDirectional(0, 1),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.of(context).greyscale200,
                              offset: Offset(0, -2),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Reset',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                showLoadingIndicator: false,
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Apply',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
