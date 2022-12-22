import '../components/idol_card_widget.dart';
import '../components/notifications_button_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CollectionScreenWidget extends StatefulWidget {
  const CollectionScreenWidget({Key? key}) : super(key: key);

  @override
  _CollectionScreenWidgetState createState() => _CollectionScreenWidgetState();
}

class _CollectionScreenWidgetState extends State<CollectionScreenWidget> {
  String? dropDownValue;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
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
          'Collection',
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
            buttonSize: 60,
            icon: Icon(
              FFIcons.kfingerHeart,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () async {
              context.pushNamed('BiasesScreen');
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: TextFormField(
                    controller: textController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'textController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search for groups and idols',
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).greyscale400,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alertRed,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alertRed,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).alternate,
                      prefixIcon: Icon(
                        FFIcons.ksearch,
                        color: FlutterFlowTheme.of(context).greyscale400,
                      ),
                      suffixIcon: textController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                textController?.clear();
                                setState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color:
                                    FlutterFlowTheme.of(context).greyscale400,
                                size: 22,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryText,
                          lineHeight: 1,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          '9 Idols',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Jua',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                      FlutterFlowDropDown<String>(
                        initialOption: dropDownValue ??= 'Default',
                        options: [
                          'A - Z',
                          'Recently Listed',
                          'Price Low to High',
                          'Price High to Low',
                          'Oldest',
                          'Default'
                        ],
                        onChanged: (val) => setState(() => dropDownValue = val),
                        width: MediaQuery.of(context).size.width * 0.4,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        icon: Icon(
                          FFIcons.kswap,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 15,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(4, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 40,
                        icon: Icon(
                          FFIcons.kfilter2,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 22,
                        ),
                        onPressed: () async {
                          context.pushNamed('FilterResultsScreen');
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pushNamed('IdolPhotocardsScreen');
                          },
                          child: IdolCardWidget(),
                        ),
                      ],
                    ),
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