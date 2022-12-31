import '../components/buy_offer_received_card_widget.dart';
import '../components/offer_received_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReceivedOffersBlockWidget extends StatefulWidget {
  const ReceivedOffersBlockWidget({Key? key}) : super(key: key);

  @override
  _ReceivedOffersBlockWidgetState createState() =>
      _ReceivedOffersBlockWidgetState();
}

class _ReceivedOffersBlockWidgetState extends State<ReceivedOffersBlockWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: FlutterFlowTheme.of(context).greyscale200,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Received Offers',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: FlutterFlowTheme.of(context).greyscale200,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  OfferReceivedCardWidget(),
                  BuyOfferReceivedCardWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
