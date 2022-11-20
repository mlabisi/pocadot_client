import '../components/listing_tag_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionCardWidget extends StatefulWidget {
  const SuggestionCardWidget({Key? key}) : super(key: key);

  @override
  _SuggestionCardWidgetState createState() => _SuggestionCardWidgetState();
}

class _SuggestionCardWidgetState extends State<SuggestionCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            ClipRRect(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://media.karousell.com/media/photos/products/2022/7/12/wtb_im_nayeon_pop_ver_rainbow__1657668775_9fcbc9b9_progressive.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Nayeon',
                  style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Jua',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                Text(
                  'IM NAYEON',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Urbanist',
                        fontSize: 12,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: ListingTagWidget(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 30,
                    fillColor: FlutterFlowTheme.of(context).alertRed,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).white,
                      size: 12,
                    ),
                    onPressed: () async {
                      swipeableStackController.triggerSwipeLeft();
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 30,
                    fillColor: FlutterFlowTheme.of(context).primaryColor,
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      color: FlutterFlowTheme.of(context).white,
                      size: 12,
                    ),
                    onPressed: () async {
                      swipeableStackController.triggerSwipeRight();
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
