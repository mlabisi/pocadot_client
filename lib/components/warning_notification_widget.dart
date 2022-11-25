import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningNotificationWidget extends StatefulWidget {
  const WarningNotificationWidget({Key? key}) : super(key: key);

  @override
  _WarningNotificationWidgetState createState() =>
      _WarningNotificationWidgetState();
}

class _WarningNotificationWidgetState extends State<WarningNotificationWidget>
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    fillColor: Color(0x14DF3F3F),
                    icon: Icon(
                      FFIcons.kwallet,
                      color: FlutterFlowTheme.of(context).alertRed,
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
                            'Credit Card Expired!',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Jua',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            '9:36 PM | Wed, Nov 23 ',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 4),
              child: Text(
                'Your card ending in 3421 has expired! Go to your More > Settings > Payment Methods to update your card.',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
