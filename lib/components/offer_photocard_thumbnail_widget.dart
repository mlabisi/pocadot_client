import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfferPhotocardThumbnailWidget extends StatefulWidget {
  const OfferPhotocardThumbnailWidget({Key? key}) : super(key: key);

  @override
  _OfferPhotocardThumbnailWidgetState createState() =>
      _OfferPhotocardThumbnailWidgetState();
}

class _OfferPhotocardThumbnailWidgetState
    extends State<OfferPhotocardThumbnailWidget> {
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
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://i.ebayimg.com/images/g/h~AAAOSw8NVis6xd/s-l500.jpg',
            width: 80,
            height: 80,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
