import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IdolCardWidget extends StatefulWidget {
  const IdolCardWidget({Key? key}) : super(key: key);

  @override
  _IdolCardWidgetState createState() => _IdolCardWidgetState();
}

class _IdolCardWidgetState extends State<IdolCardWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            width: 3,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ClipRRect(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://w.namu.la/s/521e6a9540f93408e76f33f197cfc781273af8c927d180ac1c8b969e2ffe7559c997bb0a0105476ca567a40ad7ee73763af3c034b990eb0bc9df1c91c9d2d0226237094190f37e187680fbfb2958ff1564babbb4c99ae8fe863c186c7090627a',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  'Yuqi',
                  style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Jua',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20,
                      ),
                ),
              ),
              Text(
                '(G)I-DLE',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
