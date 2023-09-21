// ignore_for_file: use_build_context_synchronously

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:telegram_night_theme/theme_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Flutter Dark Mode')),
        body: Center(
          child: ThemeSwitcher(
            builder: (context) {
              bool isLightMode =
                  ThemeModelInheritedNotifier.of(context).theme.brightness ==
                      Brightness.light;
              String themeName = isLightMode ? 'dark' : 'light';
              return DayNightSwitcherIcon(
                isDarkModeEnabled: isLightMode,
                onStateChanged: (bool lightMode) async {
                  var service = await ThemeService.instance
                    ..save(lightMode ? 'light' : 'dark');
                  var theme = service.getByName(themeName);
                  ThemeSwitcher.of(context)
                      .changeTheme(theme: theme, isReversed: lightMode);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}