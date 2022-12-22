import '../components/bias_selection_sheet_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BiasesBottomSheetWidget extends StatefulWidget {
  const BiasesBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _BiasesBottomSheetWidgetState createState() =>
      _BiasesBottomSheetWidgetState();
}

class _BiasesBottomSheetWidgetState extends State<BiasesBottomSheetWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BiasSelectionSheetWidget(),
      ),
    );
  }
}
