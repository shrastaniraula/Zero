import 'package:flutter/material.dart';
import 'package:zero/Screen/Calculator/calculator_page.dart';
import 'package:zero/Screen/Feed/feed_page.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:go_router/go_router.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final _router = GoRouter(initialLocation: '/home', routes: [
    ShellRoute(
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const FeedScreen(),
          ),
          GoRoute(
            path: '/calculator',
            builder: (context, state) => CarbonFootprintCalculator(),
          ),
          GoRoute(
            path: '/codelinter',
            builder: (context, state) => const Setting(),
          ),
          GoRoute(
            path: '/guidline',
            builder: (context, state) => const Setting(),
          )
        ]),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Color selectedColor = const Color.fromARGB(255, 0, 0, 0);
    Color unSelectedColor = const Color.fromARGB(255, 142, 142, 142);
    final selectedIndex = _calculateSelectedIndex(context);
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            builder: (data) {
              return SideMenuData(
                header: const Text('Zero'),
                items: [
                  SideMenuItemDataTile(
                    isSelected: selectedIndex == 0,
                    onTap: () => _onItemTapped(0, context),
                    title: 'Feed',
                    icon: Icon(
                      Icons.home,
                      color:
                          selectedIndex == 0 ? selectedColor : unSelectedColor,
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: selectedIndex == 1,
                    onTap: () => _onItemTapped(1, context),
                    title: 'Calculator',
                    icon: Icon(
                      Icons.calculate,
                      color:
                          selectedIndex == 1 ? selectedColor : unSelectedColor,
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: selectedIndex == 2,
                    onTap: () => _onItemTapped(2, context),
                    title: 'Codelinter',
                    icon: Icon(
                      Icons.code,
                      color:
                          selectedIndex == 2 ? selectedColor : unSelectedColor,
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: selectedIndex == 3,
                    onTap: () => _onItemTapped(3, context),
                    title: 'Guidline',
                    icon: Icon(
                      Icons.rule,
                      color:
                          selectedIndex == 3 ? selectedColor : unSelectedColor,
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: selectedIndex == 4,
                    onTap: () => _onItemTapped(4, context),
                    title: 'Setting',
                    icon: Icon(
                      Icons.settings,
                      color:
                          selectedIndex == 4 ? selectedColor : unSelectedColor,
                    ),
                  ),
                ],
                footer: const Column(children: [
                  Row(
                    children: [
                      Icon(Icons.settings),
                    ],
                  )
                ]),
              );
            },
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/calculator');
        break;
      case 2:
        GoRouter.of(context).go('/codelinter');
        break;
      case 3:
        GoRouter.of(context).go('/guidline');
        break;
    }
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/calculator')) {
      return 1;
    }
    if (location.startsWith('/codelinter')) {
      return 2;
    }
    if (location.startsWith('/guidline')) {
      return 3;
    }
    return 0;
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Setting',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
