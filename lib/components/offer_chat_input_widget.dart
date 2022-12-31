import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfferChatInputWidget extends StatefulWidget {
  const OfferChatInputWidget({Key? key}) : super(key: key);

  @override
  _OfferChatInputWidgetState createState() => _OfferChatInputWidgetState();
}

class _OfferChatInputWidgetState extends State<OfferChatInputWidget> {
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return TextFormField(
      controller: textController,
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'Type a message',
        hintStyle: FlutterFlowTheme.of(context).bodyText2,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        suffixIcon: Icon(
          FFIcons.ksend,
          color: Color(0xFF757575),
          size: 22,
        ),
      ),
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
