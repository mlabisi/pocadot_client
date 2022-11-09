import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import 'package:pocadot_client/screens/suggestions/suggestions_content.dart';
import 'package:pocadot_client/screens/suggestions/suggestions_screen.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/theme/icons.dart';
import 'package:pocadot_client/widgets/cards/swiper.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String authTokenKey = 'authToken';
const String selectedIndexKey = 'selectedIndex';


class AuthenticationState extends ChangeNotifier {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  String? authToken;
  bool isLoading = true;

  Future<void> checkForExistingToken() async {
    isLoading = true;
    if (await storage.containsKey(key: authTokenKey)) {
      authToken = await storage.read(key: authTokenKey);
      print("Token found $authToken");
    }
    isLoading = false;
    notifyListeners();
  }

  ValueNotifier<GraphQLClient> getAPIClient() {
    final HttpLink httpLink = HttpLink(dotenv.env['API_URL']!);
    final AuthLink authLink = AuthLink(
        getToken: () => authToken != null ? "Bearer $authToken" : null);
    final link = authLink.concat(httpLink);
    return ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: link,
      ),
    );
  }
}

class App extends StatefulWidget {
  final String? initialRoute;
  final BehaviorSubject<NotificationResponse> notificationSubject;
  final String? eventId;

  App(
      {Key? key,
      required this.notificationSubject,
      this.initialRoute,
      this.eventId})
      : super(key: key);

  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLoading = true;
  AuthenticationState authenticationState = AuthenticationState();

  void listenForAuthStateChanges() {
    if (isLoading != authenticationState.isLoading) {
      setState(() => isLoading = authenticationState.isLoading);
    }
  }

  @override
  void initState() {
    authenticationState.addListener(listenForAuthStateChanges);
    authenticationState.checkForExistingToken();
    super.initState();
  }

  @override
  void dispose() {
    isLoading = true;
    widget.notificationSubject.close();
    authenticationState.removeListener(listenForAuthStateChanges);
    super.dispose();
  }

  void reinitialize([String? newToken]) {
    authenticationState.authToken = newToken;
    final client = authenticationState.getAPIClient().value;
    client.resetStore(refetchQueries: false);
  }

  @override
  Widget build(BuildContext context) {
    // grab optional initialRoute from when app was opened via notification
    String? initialRoute = widget.initialRoute;
    final apiClient = authenticationState.getAPIClient();

    if (authenticationState.isLoading || isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (authenticationState.authToken != null) {
      initialRoute = widget.initialRoute ?? 'tabs view';
    }

    return GraphQLProvider(
      client: apiClient,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pocadot',
        navigatorKey: widget._navigator,
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
              return MaterialPageRoute(builder: (_) => const MakeOfferScreen());
            case '/edit-profile':
              return MaterialPageRoute(
                  builder: (_) => const EditProfileScreen());
            case '/my-listings':
              return MaterialPageRoute(
                  builder: (_) => const MyListingsScreen());
            case '/my-offers':
              return MaterialPageRoute(builder: (_) => const MyOffersScreen());
            case '/settings':
              return MaterialPageRoute(builder: (_) => const SettingsScreen());
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
              return MaterialPageRoute(builder: (_) => const ViewOfferScreen());
            case '/':
            default:
              return MaterialPageRoute(builder: (_) => const Root());
          }
        },
        initialRoute: initialRoute,
        home: const Root(),
        // ),
      ),
    );
  }
}

class Root extends StatefulWidget {
  final int? selectedIndex;

  const Root({super.key, this.selectedIndex});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  void _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    int selectedIndex = prefs.getInt(selectedIndexKey) ?? 0;
    setState(() => _selectedIndex = widget.selectedIndex ?? selectedIndex);
  }

  @override
  void initState() {
    _loadPrefs();
    super.initState();
  }

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
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomAppBar(
            key: const ValueKey('bottomNavBar'),
            color: PocadotColors.othersWhite,
            child: SizedBox(
              height: 56,
              width: constraints.widthConstraints().maxWidth,
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
    });
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
            color: selected
                ? PocadotColors.primary500
                : PocadotColors.greyscale500,
          ),
        ),
      ],
    );
  }
}
