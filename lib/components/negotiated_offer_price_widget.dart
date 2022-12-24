import '../components/offer_price_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NegotiatedOfferPriceWidget extends StatefulWidget {
  const NegotiatedOfferPriceWidget({Key? key}) : super(key: key);

  @override
  _NegotiatedOfferPriceWidgetState createState() =>
      _NegotiatedOfferPriceWidgetState();
}

class _NegotiatedOfferPriceWidgetState
    extends State<NegotiatedOfferPriceWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        OfferPriceWidget(),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xE51F222A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: FlutterFlowTheme.of(context).orange,
            ),
          ),
          child: Icon(
            FFIcons.karrowUp,
            color: FlutterFlowTheme.of(context).orange,
            size: 30,
          ),
        ),
      ],
    );
  }
}
