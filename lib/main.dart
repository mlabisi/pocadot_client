import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'http://localhost:9002/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});

  final ValueNotifier<GraphQLClient> client;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'pocadot',
        theme: ThemeData(
          primaryColor: FigmaColors.primary500,
        ),
        home: const Root(),
      ),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [
    const SuggestionsScreen(),
    const ExploreScreen(),
    const SavedScreen(),
    const ProfileScreen(),
    const MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      icon: PocadotIcons.cards,
                      activeIcon: PocadotIcons.cardsFilled,
                      selected: _selectedIndex == 0,
                      onPressed: () => _onItemTapped(0)),
                  IconBottomBar(
                      icon: IconlyLight.search,
                      activeIcon: IconlyBold.search,
                      selected: _selectedIndex == 1,
                      onPressed: () => _onItemTapped(1)),
                  IconBottomBar(
                      icon: IconlyLight.heart,
                      activeIcon: IconlyBold.heart,
                      selected: _selectedIndex == 2,
                      onPressed: () => _onItemTapped(2)),
                  IconBottomBar(
                      icon: IconlyLight.profile,
                      activeIcon: IconlyBold.profile,
                      selected: _selectedIndex == 3,
                      onPressed: () => _onItemTapped(3)),
                  IconBottomBar(
                      icon: IconlyLight.more_circle,
                      activeIcon: IconlyBold.more_circle,
                      selected: _selectedIndex == 4,
                      onPressed: () => _onItemTapped(4))
                ],
              ),
            ),
          ),
        ));
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.activeIcon,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final IconData activeIcon;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            selected ? activeIcon : icon,
            size: 25,
            color: selected ? FigmaColors.primary500 : Colors.black54,
          ),
        ),
      ],
    );
  }
}

//#region SUGGESTIONS
class SuggestionsAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  SuggestionsAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: FigmaColors.greyscale50,
        elevation: 1,
        centerTitle: false,
        title: const Text(
          "Recommendations",
          style: TextStyle(color: FigmaColors.primary500, fontFamily: 'Jua'),
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.filter, color: FigmaColors.primary500),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.notification,
                color: FigmaColors.primary500),
            onPressed: () {},
          )
        ]);
  }
}

class SuggestionsContent extends StatefulWidget {
  const SuggestionsContent({super.key});

  @override
  State<SuggestionsContent> createState() => _SuggestionsContentState();
}

class _SuggestionsContentState extends State<SuggestionsContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recommendations',
          style: TextStyle(color: FigmaColors.greyscale900)),
    );
  }
}

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuggestionsAppBar(),
      body: const SuggestionsContent(),
    );
  }
}
//endregion

//#region EXPLORE
class ExploreAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  ExploreAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: FigmaColors.greyscale50,
        elevation: 1,
        centerTitle: false,
        title: const Text(
          "Explore",
          style: TextStyle(color: FigmaColors.primary500, fontFamily: 'Jua'),
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.plus, color: FigmaColors.primary500),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.notification,
                color: FigmaColors.primary500),
            onPressed: () {},
          )
        ]);
  }
}

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
      controller: _scrollController,
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExploreAppBar(),
      body: const ExploreContent(),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            // prefixIcon: Icon(Icons.email),
            prefixIcon:
                const Icon(Icons.search, size: 20, color: Color(0xffFF5A60)),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Where are you going?',
            hintStyle: TextStyle(color: Colors.black.withOpacity(.75)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          onChanged: (value) {},
        ));
  }
}
//#endregion

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
        backgroundColor: FigmaColors.greyscale50,
        elevation: 1,
        centerTitle: false,
        title: const Text(
          "Saved",
          style: TextStyle(color: FigmaColors.primary500, fontFamily: 'Jua'),
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.edit_square,
                color: FigmaColors.primary500),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.notification,
                color: FigmaColors.primary500),
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
      child: Text('Saved', style: TextStyle(color: FigmaColors.greyscale900)),
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

//#region PROFILE
class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  ProfileAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: FigmaColors.greyscale50,
        elevation: 1,
        centerTitle: false,
        title: const Text(
          "Profile",
          style: TextStyle(color: FigmaColors.primary500, fontFamily: 'Jua'),
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.edit_square,
                color: FigmaColors.primary500),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.notification,
                color: FigmaColors.primary500),
            onPressed: () {},
          )
        ]);
  }
}

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
      child: Text('Profile', style: TextStyle(color: FigmaColors.greyscale900)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: const ProfileContent(),
    );
  }
}
//#endregion

//#region MORE
class MoreAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  MoreAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: FigmaColors.greyscale50,
        elevation: 1,
        centerTitle: false,
        title: const Text(
          "More",
          style: TextStyle(color: FigmaColors.primary500, fontFamily: 'Jua'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(IconlyLight.notification,
                color: FigmaColors.primary500),
            onPressed: () {},
          )
        ]);
  }
}

class MoreContent extends StatefulWidget {
  const MoreContent({super.key});

  @override
  State<MoreContent> createState() => _MoreContentState();
}

class _MoreContentState extends State<MoreContent> {
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
      child: Text('More', style: TextStyle(color: FigmaColors.greyscale900)),
    );
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoreAppBar(),
      body: const MoreContent(),
    );
  }
}
//#endregion
