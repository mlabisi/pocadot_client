import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pocadot',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: FigmaColors.primary500,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _screens = [
    const SuggestionsContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: SuggestionsAppBar(),
      body: Column(

      ),
      bottomNavigationBar: const CustomNavBar(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
        title: const Text(
          "Recommendations",
          style: TextStyle(color: FigmaColors.primary500, fontFamily: 'Jua'),
        ),
        actions:[
          IconButton(
            icon: const Icon(IconlyLight.filter, color: FigmaColors.primary500),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.notification, color: FigmaColors.primary500),
            onPressed: () {},
          )
        ]
    );
  }
}
class SuggestionsContainer extends StatefulWidget {
  const SuggestionsContainer({super.key});

  @override
  State<SuggestionsContainer> createState() => _SuggestionsContainerState();
}
class _SuggestionsContainerState extends State<SuggestionsContainer> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recommendations', style: TextStyle(color: FigmaColors.greyscale900)),
    );
  }
}


class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}
class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
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
