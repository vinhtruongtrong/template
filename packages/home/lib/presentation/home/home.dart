import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/app/routes/router.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AutoTabsScaffold(
        homeIndex: 0,
        // appBarBuilder: (context, tabsRouter) {
        //   // tabsRouter.topRoute.
        //   return AppBar(
        //     title: Text(titleMap[tabsRouter.topMatch.meta['title']] ?? 'NULL'),
        //     leading:
        //         tabsRouter.canPopSelfOrChildren ? const AutoBackButton() : null,
        //   );
        // },
        builder: (context, child, animation) {
          return child;
        },
        routes: const [
          PostTabRoute(),
          SettingsTabRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
          final hideBottomNav =
              tabsRouter.topMatch.meta['hideBottomNav'] == true;
          return hideBottomNav
              ? const SizedBox.shrink()
              : BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  unselectedFontSize: 12,
                  selectedFontSize: 12,
                  onTap: tabsRouter.setActiveIndex,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.pets_outlined),
                      label: 'Post',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                );
        },
      ),
    );
  }
}
