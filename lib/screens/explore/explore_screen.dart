import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pocadot_client/widgets/common/fake_search_bar.dart';
import 'package:pocadot_client/widgets/common/search_bar.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';

//#region EXPLORE
class ExploreContent extends StatefulWidget {
  const ExploreContent({super.key});

  @override
  State<ExploreContent> createState() => _ExploreContentState();
}

class _ExploreContentState extends State<ExploreContent> {
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: GestureDetector(
              onTapDown: (_) => Navigator.pushNamed(context, '/search'),
              child: const FakeSearchBar(
                hintText: 'Search for groups and idols',
              )),
        ),
      ],
      controller: _scrollController,
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabAppBar(title: 'Explore', actions: [
        IconButton(
          icon: const Icon(IconlyLight.plus, color: PocadotColors.primary500),
          onPressed: () {
            Navigator.pushNamed(context, '/add-listing');
          },
        ),
        IconButton(
          icon: const Icon(IconlyLight.notification,
              color: PocadotColors.primary500),
          onPressed: () {
            Navigator.pushNamed(context, '/notifications');
          },
        )
      ]),
      body: const ExploreContent(),
    );
  }
}
//#endregion
