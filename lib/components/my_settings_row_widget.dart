import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MySettingsRowWidget extends StatefulWidget {
  const MySettingsRowWidget({Key? key}) : super(key: key);

  @override
  _MySettingsRowWidgetState createState() => _MySettingsRowWidgetState();
}

class _MySettingsRowWidgetState extends State<MySettingsRowWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: FlutterFlowTheme.of(context).greyscale200,
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                fillColor: FlutterFlowTheme.of(context).alternate,
                icon: Icon(
                  FFIcons.ksetting,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 24,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'My Settings',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Jua',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Modify your notification settings, preferences, and more.',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
