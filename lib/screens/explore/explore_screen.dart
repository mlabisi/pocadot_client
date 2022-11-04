import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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

  late TextEditingController _textEditingController;
  String _textEditingControllerValue = '';

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  _editListener() {
    setState(() {
      _textEditingControllerValue = _textEditingController.value.text;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _textEditingController = TextEditingController();
    _textEditingController.addListener(_editListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SearchBar(
              textController: _textEditingController,
              hintText: 'Search for groups and idols',
            ),
          ),
        ],
        controller: _scrollController,
      ),
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
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(IconlyLight.notification,
              color: PocadotColors.primary500),
          onPressed: () {},
        )
      ]),
      body: const ExploreContent(),
    );
  }
}
//#endregion
