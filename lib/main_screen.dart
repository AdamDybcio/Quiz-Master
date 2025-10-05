import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/core/presentation/blocs/page_index_cubit.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/achievements/presentation/pages/achievement_page.dart';
import 'package:quiz_master/features/browse/presentation/pages/browse_page.dart';
import 'package:quiz_master/features/home/presentation/pages/home_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    final pages = const [HomePage(), BrowsePage(), AchievementPage()];

    return Responsive(
      mobile: BlocBuilder<PageIndexCubit, int>(
        bloc: sl<PageIndexCubit>(),
        builder: (context, currentIndex) {
          return Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => sl<PageIndexCubit>().setPage(index),
              selectedIconTheme: IconThemeData(color: Colors.purpleAccent),
              selectedLabelStyle: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.w600,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.solidHouse),
                  label: AppLocalizations.of(context)!.home,
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  label: AppLocalizations.of(context)!.browse,
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.trophy),
                  label: AppLocalizations.of(context)!.achievements,
                ),
              ],
            ),
          );
        },
      ),
      tablet: BlocBuilder<PageIndexCubit, int>(
        bloc: sl<PageIndexCubit>(),
        builder: (context, currentIndex) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: currentIndex,
                  onDestinationSelected: (index) =>
                      sl<PageIndexCubit>().setPage(index),
                  minWidth: 96,
                  labelType: NavigationRailLabelType.all,
                  selectedIconTheme: IconThemeData(color: Colors.purpleAccent),
                  selectedLabelTextStyle: TextStyle(
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.w600,
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.solidHouse),
                      label: Text(AppLocalizations.of(context)!.home),
                    ),
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                      label: Text(AppLocalizations.of(context)!.browse),
                    ),
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.trophy),
                      label: Text(AppLocalizations.of(context)!.achievements),
                    ),
                  ],
                ),
                Expanded(child: pages[currentIndex]),
              ],
            ),
          );
        },
      ),
      desktop: BlocBuilder<PageIndexCubit, int>(
        bloc: sl<PageIndexCubit>(),
        builder: (context, currentIndex) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  extended: true,
                  selectedIconTheme: IconThemeData(color: Colors.purpleAccent),
                  selectedLabelTextStyle: TextStyle(
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.w600,
                  ),
                  selectedIndex: currentIndex,
                  onDestinationSelected: (index) =>
                      sl<PageIndexCubit>().setPage(index),
                  minWidth: 96,
                  destinations: [
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.solidHouse),
                      label: Text(AppLocalizations.of(context)!.home),
                    ),
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                      label: Text(AppLocalizations.of(context)!.browse),
                    ),
                    NavigationRailDestination(
                      icon: FaIcon(FontAwesomeIcons.trophy),
                      label: Text(AppLocalizations.of(context)!.achievements),
                    ),
                  ],
                ),
                Expanded(child: pages[currentIndex]),
              ],
            ),
          );
        },
      ),
    );
  }
}
