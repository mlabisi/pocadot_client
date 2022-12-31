import '../components/offer_photocard_thumbnail_widget.dart';
import '../components/offer_price_widget.dart';
import '../components/photocard_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfferChatBubbleWidget extends StatefulWidget {
  const OfferChatBubbleWidget({Key? key}) : super(key: key);

  @override
  _OfferChatBubbleWidgetState createState() => _OfferChatBubbleWidgetState();
}

class _OfferChatBubbleWidgetState extends State<OfferChatBubbleWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

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
              'papagowon wants to trade!',
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
                          '“I’d love to trade you for this Gowon photocard!”',
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
                    child: OfferPriceWidget(),
                  ),
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.85,
                              child: PhotocardDetailsWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: OfferPhotocardThumbnailWidget(),
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
