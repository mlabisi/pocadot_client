import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListingTagWidget extends StatefulWidget {
  const ListingTagWidget({Key? key}) : super(key: key);

  @override
  _ListingTagWidgetState createState() => _ListingTagWidgetState();
}

class _ListingTagWidgetState extends State<ListingTagWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(22),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
        child: Text(
          'WTS/WTT',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 10,
              ),
        ),
      ),
    );
  }
}
