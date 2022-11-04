import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/common/search_bar.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({super.key});

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
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
              autofocus: true,
            ),
          ),
        ],
        controller: _scrollController,
      ),
    );
  }
}

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(title: 'Search', actions: [
        IconButton( // TODO: useCallback to hide when there are no results??
          icon: const Icon(IconlyLight.filter, color: PocadotColors.primary500),
          onPressed: () {
            Navigator.pushNamed(context, '/filter-results');
          },
        ),
        IconButton(
          icon: const Icon(IconlyLight.swap, color: PocadotColors.primary500),
          onPressed: () {},
        )
      ]),
      body: const SearchContent(),
    );
  }
}
