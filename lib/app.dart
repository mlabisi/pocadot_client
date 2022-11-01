import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/explore/explore_screen.dart';
import 'package:pocadot_client/more/more_screen.dart';
import 'package:pocadot_client/profile/profile_screen.dart';
import 'package:pocadot_client/saved/saved_screen.dart';
import 'package:pocadot_client/suggestions/suggestions_screen.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: HttpLink("http://localhost:9002/graphql/"),
      )),
      // child: ChangeNotifierProvider<UsersProvider>(
      //   create: (context) => UsersProvider(),
      //   child: MaterialApp(
      //   title: 'pocadot',
      //   theme: ThemeData(
      //     primaryColor: FigmaColors.primary500,
      //   ),
      //   home: const Root(),
      // ),
      // ),
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
