import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhotocardThumbnailWidget extends StatefulWidget {
  const PhotocardThumbnailWidget({Key? key}) : super(key: key);

  @override
  _PhotocardThumbnailWidgetState createState() =>
      _PhotocardThumbnailWidgetState();
}

class _PhotocardThumbnailWidgetState extends State<PhotocardThumbnailWidget> {
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
            'https://pocadot.b-cdn.net/reclnaz03rdkqyOlU.png',
            width: MediaQuery.of(context).size.width * 0.16,
            height: MediaQuery.of(context).size.height * 0.12,
            fit: BoxFit.fitHeight,
          ),
        ),
        if (false)
          Container(
            width: MediaQuery.of(context).size.width * 0.16,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              color: Color(0x7F212121),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
      ],
    );
  }
}
