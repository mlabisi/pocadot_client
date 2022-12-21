import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsButtonWidget extends StatefulWidget {
  const NotificationsButtonWidget({Key? key}) : super(key: key);

  @override
  _NotificationsButtonWidgetState createState() =>
      _NotificationsButtonWidgetState();
}

class _NotificationsButtonWidgetState extends State<NotificationsButtonWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30,
      borderWidth: 1,
      buttonSize: 60,
      icon: Icon(
        FFIcons.knotification,
        color: FlutterFlowTheme.of(context).primaryColor,
        size: 30,
      ),
      onPressed: () async {
        context.pushNamed('NotificationsScreen');
      },
    );
  }
}
