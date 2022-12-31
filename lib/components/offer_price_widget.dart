import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfferPriceWidget extends StatefulWidget {
  const OfferPriceWidget({Key? key}) : super(key: key);

  @override
  _OfferPriceWidgetState createState() => _OfferPriceWidgetState();
}

class _OfferPriceWidgetState extends State<OfferPriceWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x230E151B),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryColor,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$25',
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
