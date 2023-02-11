import 'package:flutter/material.dart';

import 'themes/dark/dark_theme.dart';
import 'themes/main_theme.dart';
import 'ui/pages/search_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTheme(
      theme: DarkThemeData(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            home: SearchPage.create(),
            debugShowCheckedModeBanner: false,
            theme: MainTheme.of(context).themeData,
          );
        },
      ),
    );
  }
}
