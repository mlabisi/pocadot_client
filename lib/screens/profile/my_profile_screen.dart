import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';

//#region PROFILE
class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
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
      child:
          Text('Profile', style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabAppBar(title: 'My Profile', actions: [
        IconButton(
          icon: const Icon(IconlyLight.edit_square,
              color: PocadotColors.primary500),
          onPressed: () {
            Navigator.pushNamed(context, '/edit-profile');
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
      body: const ProfileContent(),
    );
  }
}
//#endregion
