import 'package:flutter/material.dart';
import 'package:pocadot_client/widgets/common/search_bar.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: (18)),
          child: SearchBar(
            textController: _textEditingController,
            hintText: 'Search for groups and idols',
            autofocus: true,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            child: CustomScrollView(
              slivers: const [],
              controller: _scrollController,
            ),
          ),
        ),
      ],
    );
  }
}
