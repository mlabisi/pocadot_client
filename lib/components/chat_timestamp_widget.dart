import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatTimestampWidget extends StatefulWidget {
  const ChatTimestampWidget({Key? key}) : super(key: key);

  @override
  _ChatTimestampWidgetState createState() => _ChatTimestampWidgetState();
}

class _ChatTimestampWidgetState extends State<ChatTimestampWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 4),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          borderRadius: BorderRadius.circular(22),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
          child: Text(
            '2:08 PM',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Urbanist',
                  color: FlutterFlowTheme.of(context).primaryColor,
                  fontSize: 10,
                ),
          ),
        ),
      ),
    );
  }
}
