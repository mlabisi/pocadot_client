import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GenericAlertWidget extends StatefulWidget {
  const GenericAlertWidget({Key? key}) : super(key: key);

  @override
  _GenericAlertWidgetState createState() => _GenericAlertWidgetState();
}

class _GenericAlertWidgetState extends State<GenericAlertWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      decoration: BoxDecoration(
        color: Color(0x34246BFD),
        borderRadius: BorderRadius.circular(22),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FFIcons.kinfoCircle,
              color: Color(0xFF4479FF),
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
                      'Do you use a social media account (such as Apple, Google, Instagram, etc) to login? If so, you should logout and use \"Forgot Password\" to create a password.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF4479FF),
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
