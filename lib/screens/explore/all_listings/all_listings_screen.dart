import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class AllListingsContent extends StatefulWidget {
  const AllListingsContent({super.key});

  @override
  State<AllListingsContent> createState() => _AllListingsContentState();
}

class _AllListingsContentState extends State<AllListingsContent> {
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
    return const Center(
      child: Text('All Listings',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class AllListingsScreen extends HookWidget {
  const AllListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StackAppBar(title: 'All Listings', actions: [
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
      body: const AllListingsContent(),
    );
  }
}
