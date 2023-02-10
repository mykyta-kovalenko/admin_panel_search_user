import 'package:flutter/material.dart';

part 'theme/main_color_theme_data.dart';
part 'theme/main_text_theme_data.dart';
part 'theme/main_theme_data.dart';

class MainTheme extends InheritedWidget {
  const MainTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  static MainThemeData of(BuildContext context) => maybeOf(context)!;
  static MainThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainTheme>()?.theme;
  }

  static MainTextThemeData text(BuildContext context) => of(context).textTheme;
  static MainColorThemeData color(BuildContext context) =>
      of(context).colorTheme;

  final MainThemeData theme;

  @override
  bool updateShouldNotify(MainTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}