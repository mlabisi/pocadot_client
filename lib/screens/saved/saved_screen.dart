import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

//#region SAVED
class SavedAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  SavedAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: PocadotColors.greyscale50,
        elevation: 1,
        centerTitle: false,
        title: const Text(
          "Saved",
          style: TextStyle(color: PocadotColors.primary500, fontFamily: 'Jua'),
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.edit_square,
                color: PocadotColors.primary500),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.notification,
                color: PocadotColors.primary500),
            onPressed: () {},
          )
        ]);
  }
}

class SavedContent extends StatefulWidget {
  const SavedContent({super.key});

  @override
  State<SavedContent> createState() => _SavedContentState();
}

class _SavedContentState extends State<SavedContent> {
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
      child: Text('Saved', style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SavedAppBar(),
      body: const SavedContent(),
    );
  }
}
//#endregion
