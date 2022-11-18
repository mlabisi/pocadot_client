import 'package:flutter/material.dart';
import 'package:pocadot_client/screens/explore/ui/explore_content.dart';
import 'package:pocadot_client/screens/explore/ui/~graphql/__generated__/explore_screen.query.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pocadot_client/utils.dart';
import 'package:pocadot_client/widgets/common/fake_search_bar.dart';
import 'package:pocadot_client/widgets/common/search_bar.dart';
import 'package:pocadot_client/widgets/navigation/main_tab_app_bar.dart';

//#region EXPLORE
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Query$ExploreScreen$Widget(builder: (result, {refetch, fetchMore}) {
      final noDataWidget = validateResult(result);
      if (noDataWidget != null) return noDataWidget;

      final featured = result.parsedData!.featuredListings;

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
        body: ExploreContent(
          featured: featured,
          refresh: refetch!,
          fetchMore: fetchMore!,
        ),
      );
    });
  }
}
//#endregion
