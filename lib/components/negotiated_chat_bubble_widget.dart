import '../components/negotiated_offer_photocard_thumbnail_widget.dart';
import '../components/negotiated_offer_price_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NegotiatedChatBubbleWidget extends StatefulWidget {
  const NegotiatedChatBubbleWidget({Key? key}) : super(key: key);

  @override
  _NegotiatedChatBubbleWidgetState createState() =>
      _NegotiatedChatBubbleWidgetState();
}

class _NegotiatedChatBubbleWidgetState
    extends State<NegotiatedChatBubbleWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You negotiated papagowon\'s offer!',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w800,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: Text(
                          '\"Can you go higher on the price? Can you trade a different Gowon PC? I already have that one.\"',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                    child: NegotiatedOfferPriceWidget(),
                  ),
                  NegotiatedOfferPhotocardThumbnailWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
