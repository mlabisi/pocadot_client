import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

//#region CountrySettings
class CountrySettingsContent extends StatefulWidget {
  const CountrySettingsContent({super.key});

  @override
  State<CountrySettingsContent> createState() => _CountrySettingsContentState();
}

class _CountrySettingsContentState extends State<CountrySettingsContent> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Country Settings',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class CountrySettingsScreen extends StatelessWidget {
  const CountrySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(
          title: 'Country Settings'
      ),
      body: const CountrySettingsContent(),
    );
  }
}
//#endregion
