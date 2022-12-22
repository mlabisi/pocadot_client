import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BiasSelectionWidget extends StatefulWidget {
  const BiasSelectionWidget({Key? key}) : super(key: key);

  @override
  _BiasSelectionWidgetState createState() => _BiasSelectionWidgetState();
}

class _BiasSelectionWidgetState extends State<BiasSelectionWidget> {
  bool? checkboxListTileValue;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: Container(
        width: 100,
        height: 70,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).primaryColor,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    'https://w.namu.la/s/521e6a9540f93408e76f33f197cfc781273af8c927d180ac1c8b969e2ffe7559c997bb0a0105476ca567a40ad7ee73763af3c034b990eb0bc9df1c91c9d2d0226237094190f37e187680fbfb2958ff1564babbb4c99ae8fe863c186c7090627a',
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor:
                      FlutterFlowTheme.of(context).secondaryText,
                ),
                child: CheckboxListTile(
                  value: checkboxListTileValue ??= true,
                  onChanged: (newValue) async {
                    setState(() => checkboxListTileValue = newValue!);
                  },
                  title: Text(
                    'Yuqi',
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                  subtitle: Text(
                    '(G)I-DLE',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  activeColor: FlutterFlowTheme.of(context).primaryColor,
                  checkColor: FlutterFlowTheme.of(context).primaryBtnText,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}