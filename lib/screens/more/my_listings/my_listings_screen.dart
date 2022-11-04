import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

//#region MyListings
class MyListingsContent extends StatefulWidget {
  const MyListingsContent({super.key});

  @override
  State<MyListingsContent> createState() => _MyListingsContentState();
}

class _MyListingsContentState extends State<MyListingsContent> {
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
      child: Text('My Listings',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(
        title: 'My Listings',
        backIcon: Icons.arrow_back,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(IconlyLight.edit_square))
        ],
      ),
      body: const MyListingsContent(),
    );
  }
}
//#endregion
