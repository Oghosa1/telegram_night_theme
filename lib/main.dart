import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:telegram_night_theme/home_page.dart';

import 'package:telegram_night_theme/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  runApp(MyApp(theme: initTheme));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.theme,
  }) : super(key: key);
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: theme,
      builder: (_, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: HomePage(),
        );
      },
    );
  }
}
