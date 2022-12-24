import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReceivedChatBubbleWidget extends StatefulWidget {
  const ReceivedChatBubbleWidget({Key? key}) : super(key: key);

  @override
  _ReceivedChatBubbleWidgetState createState() =>
      _ReceivedChatBubbleWidgetState();
}

class _ReceivedChatBubbleWidgetState extends State<ReceivedChatBubbleWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 16, 0, 4),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x33A3B0EF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Okay, will do!',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
