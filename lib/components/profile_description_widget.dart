import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDescriptionWidget extends StatefulWidget {
  const ProfileDescriptionWidget({Key? key}) : super(key: key);

  @override
  _ProfileDescriptionWidgetState createState() =>
      _ProfileDescriptionWidgetState();
}

class _ProfileDescriptionWidgetState extends State<ProfileDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'foReVe',
              style: FlutterFlowTheme.of(context).title3,
            ),
          ],
        ),
        Wrap(
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
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Text(
                'I’m just trying to make money so I can buy more Red Velvet albums 🥴',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 30,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  FFIcons.ktwitter,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 30,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  FFIcons.kcarrdSymbol,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 30,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
