import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferReceivedCardWidget extends StatefulWidget {
  const OfferReceivedCardWidget({Key? key}) : super(key: key);

  @override
  _OfferReceivedCardWidgetState createState() =>
      _OfferReceivedCardWidgetState();
}

class _OfferReceivedCardWidgetState extends State<OfferReceivedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Color(0x34000000),
              offset: Offset(-2, 5),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 4,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Offer Received',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Nayeon',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Jua',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 0),
                            child: Text(
                              'IM NAYEON',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '+ view nayeonpop\'s offer',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/nayeon.png',
                  width: 75,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
