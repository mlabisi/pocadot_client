import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfferEditedAlertWidget extends StatefulWidget {
  const OfferEditedAlertWidget({Key? key}) : super(key: key);

  @override
  _OfferEditedAlertWidgetState createState() => _OfferEditedAlertWidgetState();
}

class _OfferEditedAlertWidgetState extends State<OfferEditedAlertWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Color(0x33FF981F),
        borderRadius: BorderRadius.circular(22),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FFIcons.kinfoCircle,
              color: FlutterFlowTheme.of(context).orange,
              size: 18,
            ),
            Expanded(
              child: Wrap(
                spacing: 0,
                runSpacing: 0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                    child: Text(
                      'papagowon edited their offer!',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).orange,
                            fontSize: 14,
                          ),
                    ),
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