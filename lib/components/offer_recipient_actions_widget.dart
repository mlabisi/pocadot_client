import '../components/accept_offer_modal_widget.dart';
import '../components/negotiation_actions_widget.dart';
import '../components/reject_offer_modal_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfferRecipientActionsWidget extends StatefulWidget {
  const OfferRecipientActionsWidget({Key? key}) : super(key: key);

  @override
  _OfferRecipientActionsWidgetState createState() =>
      _OfferRecipientActionsWidgetState();
}

class _OfferRecipientActionsWidgetState
    extends State<OfferRecipientActionsWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(32, 16, 32, 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.85,
                          child: NegotiationActionsWidget(),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                text: 'Negotiate',
                options: FFButtonOptions(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  color: FlutterFlowTheme.of(context).orange,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).white,
                        fontWeight: FontWeight.bold,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Color(0x5A090F13),
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: double.infinity,
                          child: AcceptOfferModalWidget(),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                text: 'Accept',
                options: FFButtonOptions(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  color: FlutterFlowTheme.of(context).alertGreen,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).white,
                        fontWeight: FontWeight.bold,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Color(0x5A090F13),
                  isDismissible: false,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        height: double.infinity,
                        child: RejectOfferModalWidget(),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              text: 'Reject',
              options: FFButtonOptions(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                color: FlutterFlowTheme.of(context).alertRed,
                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).white,
                      fontWeight: FontWeight.bold,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
