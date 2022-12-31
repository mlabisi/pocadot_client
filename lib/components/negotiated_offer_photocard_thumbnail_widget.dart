import '../components/offer_photocard_thumbnail_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NegotiatedOfferPhotocardThumbnailWidget extends StatefulWidget {
  const NegotiatedOfferPhotocardThumbnailWidget({Key? key}) : super(key: key);

  @override
  _NegotiatedOfferPhotocardThumbnailWidgetState createState() =>
      _NegotiatedOfferPhotocardThumbnailWidgetState();
}

class _NegotiatedOfferPhotocardThumbnailWidgetState
    extends State<NegotiatedOfferPhotocardThumbnailWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        OfferPhotocardThumbnailWidget(),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xE51F222A),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x230E151B),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: FlutterFlowTheme.of(context).orange,
            ),
          ),
          child: Icon(
            Icons.close,
            color: FlutterFlowTheme.of(context).orange,
            size: 30,
          ),
        ),
      ],
    );
  }
}
