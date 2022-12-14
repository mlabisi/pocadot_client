import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/screens/explore/all_listings/all_listings_screen.dart';
import 'package:pocadot_client/screens/explore/collection/collection_screen.dart';
import 'package:pocadot_client/screens/explore/explore_screen.dart';
import 'package:pocadot_client/screens/explore/search/search_screen.dart';
import 'package:pocadot_client/screens/more/change_password/change_password_screen.dart';
import 'package:pocadot_client/screens/more/more_screen.dart';
import 'package:pocadot_client/screens/more/my_listings/my_listings_screen.dart';
import 'package:pocadot_client/screens/more/my_offers/my_offers_screen.dart';
import 'package:pocadot_client/screens/more/settings/connected_accounts/connected_accounts_screen.dart';
import 'package:pocadot_client/screens/more/settings/payment_methods/payment_methods_screen.dart';
import 'package:pocadot_client/screens/more/settings/push_notifications/push_notifications_settings_screen.dart';
import 'package:pocadot_client/screens/more/settings/settings_screen.dart';
import 'package:pocadot_client/screens/profile/edit/edit_profile_screen.dart';
import 'package:pocadot_client/screens/profile/my_profile_screen.dart';
import 'package:pocadot_client/screens/saved/saved_screen.dart';
import 'package:pocadot_client/screens/shared/listings/add_listing_screen.dart';
import 'package:pocadot_client/screens/shared/biases/biases_screen.dart';
import 'package:pocadot_client/screens/shared/listings/filter_results_screen.dart';
import 'package:pocadot_client/screens/shared/listings/make_offer_screen.dart';
import 'package:pocadot_client/screens/shared/listings/view_offer_screen.dart';
import 'package:pocadot_client/screens/shared/notifications/notifications_screen.dart';
import 'package:pocadot_client/screens/shared/settings/view_country_settings_screen.dart';
import 'package:pocadot_client/screens/shared/settings/view_language_settings_screen.dart';
import 'package:pocadot_client/screens/shared/views/view_listing_screen.dart';
import 'package:pocadot_client/screens/shared/views/view_profile_screen.dart';
import 'package:pocadot_client/screens/suggestions/preferences/suggestion_preferences_screen.dart';
import 'package:pocadot_client/screens/suggestions/suggestions_screen.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'pocadot',
        theme: ThemeData(
            primaryColor: PocadotColors.primary500, fontFamily: 'Urbanist'),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/suggestion-preferences':
              return MaterialPageRoute(
                  builder: (_) => const SuggestionPreferencesScreen());
            case '/notifications':
              return MaterialPageRoute(
                  builder: (_) => const NotificationsScreen());
            case '/biases':
              return MaterialPageRoute(builder: (_) => const BiasesScreen());
            case '/add-listing':
              return MaterialPageRoute(
                  builder: (_) => const AddListingScreen());
            case '/collection':
              return MaterialPageRoute(
                  builder: (_) => const CollectionScreen());
            case '/search':
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const SearchScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              );
            case '/filter-results':
              return MaterialPageRoute(
                  builder: (_) => const FilterResultsScreen());
            case '/all-listings':
              return MaterialPageRoute(
                  builder: (_) => const AllListingsScreen());
            case '/view-listing':
              return MaterialPageRoute(
                  builder: (_) => const ViewListingScreen());
            case '/view-profile':
              return MaterialPageRoute(
                  builder: (_) => const ViewProfileScreen());
            case '/make-offer':
              return MaterialPageRoute(
                  builder: (_) => const MakeOfferScreen());
            case '/edit-profile':
              return MaterialPageRoute(
                  builder: (_) => const EditProfileScreen());
            case '/my-listings':
              return MaterialPageRoute(
                  builder: (_) => const MyListingsScreen());
            case '/my-offers':
              return MaterialPageRoute(
                  builder: (_) => const MyOffersScreen());
            case '/settings':
              return MaterialPageRoute(
                  builder: (_) => const SettingsScreen());
            case '/push-notification-settings':
              return MaterialPageRoute(
                  builder: (_) => const PushNotificationSettingsScreen());
            case '/payment-methods':
              return MaterialPageRoute(
                  builder: (_) => const PaymentMethodsScreen());
            case '/connected-accounts':
              return MaterialPageRoute(
                  builder: (_) => const ConnectedAccountsScreen());
            case '/language-settings':
              return MaterialPageRoute(
                  builder: (_) => const LanguageSettingsScreen());
            case '/country-settings':
              return MaterialPageRoute(
                  builder: (_) => const CountrySettingsScreen());
            case '/help-center':
              return MaterialPageRoute(
                  builder: (_) => const CountrySettingsScreen());
            case '/change-password':
              return MaterialPageRoute(
                  builder: (_) => const ChangePasswordScreen());
            case '/view-offer':
              return MaterialPageRoute(
                  builder: (_) => const ViewOfferScreen());
            case '/':
            default:
              return MaterialPageRoute(builder: (_) => const Root());
          }
        },
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
            color: selected ? PocadotColors.primary500 : Colors.black54,
          ),
        ),
      ],
    );
  }
}
