import '../components/change_password_row_widget.dart';
import '../components/delete_account_button_widget.dart';
import '../components/logout_button_widget.dart';
import '../components/logout_sheet_widget.dart';
import '../components/my_biases_row_widget.dart';
import '../components/my_listings_row_widget.dart';
import '../components/my_offers_row_widget.dart';
import '../components/my_settings_row_widget.dart';
import '../components/notifications_button_widget.dart';
import '../components/pocadot_socials_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoreScreenWidget extends StatefulWidget {
  const MoreScreenWidget({Key? key}) : super(key: key);

  @override
  _MoreScreenWidgetState createState() => _MoreScreenWidgetState();
}

class _MoreScreenWidgetState extends State<MoreScreenWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'More',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 22,
              ),
        ),
        actions: [
          NotificationsButtonWidget(),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () async {
                    context.pushNamed('SearchScreen');
                  },
                  child: MyListingsRowWidget(),
                ),
                InkWell(
                  onTap: () async {
                    context.pushNamed('OffersScreen');
                  },
                  child: MyOffersRowWidget(),
                ),
                InkWell(
                  onTap: () async {
                    context.pushNamed('BiasesScreen');
                  },
                  child: MyBiasesRowWidget(),
                ),
                InkWell(
                  onTap: () async {
                    context.pushNamed('SettingsScreen');
                  },
                  child: MySettingsRowWidget(),
                ),
                InkWell(
                  onTap: () async {
                    context.pushNamed('ChangePasswordScreen');
                  },
                  child: ChangePasswordRowWidget(),
                ),
                InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: LogoutSheetWidget(),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: LogoutButtonWidget(),
                ),
                DeleteAccountButtonWidget(),
                PocadotSocialsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
