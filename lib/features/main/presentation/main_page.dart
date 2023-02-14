import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/remote_config/remote_config_service.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sl<RemoteConfigService>().checkAndShowSoftUpdate(context);
    });
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        CollectionsRoute(),
        MoreRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: context.localizations.navigation_bar_home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.collections),
                label: context.localizations.navigation_bar_collections,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.more_horiz),
                label: context.localizations.navigation_bar_more,
              ),
            ],
          ),
        );
      },
    );
  }
}
