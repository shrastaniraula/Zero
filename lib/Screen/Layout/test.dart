import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Repository/Auth/auth_repository.dart';
import 'package:zero/Screen/Calculator/calculator_page.dart';
import 'package:zero/Screen/Codelint/codelint_page.dart';
import 'package:zero/Screen/Feed/feed_page.dart';
import 'package:zero/Screen/Guildelines/guideline_tab.dart';

import 'package:shared_preferences/shared_preferences.dart';

class layout extends StatelessWidget {
  layout({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: canvasColor,
                    title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SizeBar(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) SizeBar(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SizeBar extends StatefulWidget {
  const SizeBar({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  _SizeBarState createState() => _SizeBarState();
}

class _SizeBarState extends State<SizeBar> {
  AuthRepository authRepository = AuthRepository();
  AuthUser? authUser;
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    AuthUser? user = await authRepository.getAuthUser();
    setState(() {
      authUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget._controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          border: Border.all(
            color: actionColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255),
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white10,
        ),
      ),
      // footerDivider: divider,
      headerBuilder: (context, extended) {
        return Container(
          height: 150,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage:
                    NetworkImage('https://thispersondoesnotexist.com/'),
              ),
              Text(
                '${authUser?.name ?? 'userName'}',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${authUser?.email ?? 'user@example.com'}',
                style: GoogleFonts.aBeeZee(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.calculate,
          label: 'Calculator',
        ),
        const SidebarXItem(
          icon: Icons.code,
          label: 'CodeLint',
        ),
        const SidebarXItem(
          icon: Icons.tips_and_updates,
          label: 'Tips',
        ),
      ],
      footerItems: [
        SidebarXItem(
          onTap: () {
            _showLogoutConfirmationDialog(context);
          },
          icon: Icons.logout,
          label: 'Log out',
        ),
      ],
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User canceled
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User confirmed
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    ); // If the user confirmed, log out
    if (confirmed == true) {
      // Clear shared preferences data
      await _clearSharedPreferences();

      // Navigate to the splash screen
    }
  }

  // Function to clear shared preferences data
  Future<void> _clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all data in shared preferences
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return const FeedScreen();
          case 1:
            return CarbonFootprintCalculator();
          case 2:
            return CodeLint();
          case 3:
            return Guide();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'Test Your Code';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color.fromARGB(255, 0, 0, 0);
const canvasColor = Colors.white;
const scaffoldBackgroundColor = AppTheme.background;
const accentCanvasColor = Color.fromARGB(255, 0, 0, 0);
const white = Color.fromARGB(255, 0, 0, 0);
final actionColor = const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6);
