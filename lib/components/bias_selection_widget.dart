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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

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
                  child: Image.asset(
                    'assets/images/yuqi.jpeg',
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
                      FlutterFlowTheme.of(context).primaryColor,
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
                  checkColor: FlutterFlowTheme.of(context).white,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
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
