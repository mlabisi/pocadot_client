import 'package:flutter/material.dart';
import 'package:pocadot_client/graphql/__generated__/schema.graphql.dart';
import 'package:pocadot_client/screens/explore/ui/~graphql/__generated__/explore.fragment.graphql.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/cards/listing_card.dart';
import 'package:pocadot_client/widgets/cards/recommendation_card.dart';
import 'package:pocadot_client/widgets/cards/swiper.dart';
import 'package:pocadot_client/widgets/common/fake_search_bar.dart';

class ExploreContent extends StatefulWidget {
  final List<Fragment$featuredListings> featured;
  final Function refresh;
  final Function fetchMore;

  const ExploreContent(
      {Key? key,
      required this.featured,
      required this.refresh,
      required this.fetchMore})
      : super(key: key);

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  List<Widget> getFeatured(BoxConstraints constraints) {
    return widget.featured.map((e) {
      return ListingCard(
        avatarImage: 'assets/demo/nayeon.png',
        featuredImage: 'assets/demo/nayeon.png',
        listingTag:
            e.type.map((e) => toJson$Enum$ListingType(e)).toList().join('/'),
        username: e.listedBy.profile.username,
        artist: e.idols.map((e) => e.name).toList().join(', '),
        release: e.release,
        onPressed: () {},
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: (16), top: (18), right: (16), bottom: 12),
              child: GestureDetector(
                  onTapDown: (_) => Navigator.pushNamed(context, '/search'),
                  child: const FakeSearchBar(
                    hintText: 'Search for groups and idols',
                  )),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Collections",
                            style: TextStyle(
                              color: PocadotColors.greyscale900,
                              fontFamily: 'Jua',
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: SizedBox(
                    height: constraints.heightConstraints().maxHeight * 0.25,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 16.0,
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/demo/girlGroups.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/demo/boyGroups.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                  )),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: SizedBox(
                            child: Text(
                              "Featured Listings",
                              style: TextStyle(
                                color: PocadotColors.greyscale900,
                                fontFamily: 'Jua',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTapDown: (_) {},
                          child: const Text(
                            "See All",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: PocadotColors.primary500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),

                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverGrid(
                        delegate:
                            SliverChildListDelegate(getFeatured(constraints)),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.55,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 8,
                        )),
                  ),

                  // SliverToBoxAdapter(
                  //   child: GridView.count(
                  //     childAspectRatio: 1 / 1.55,
                  //     crossAxisCount: 2,
                  //     padding: const EdgeInsets.only(top: 12),
                  //     mainAxisSpacing: 12,
                  //     crossAxisSpacing: 8,
                  //     children: getFeatured(constraints),
                  //   ),
                  // )
                ],
              ),
            ),
          ]);
    });
  }
}
