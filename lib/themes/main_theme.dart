import 'package:flutter/material.dart';

part 'theme/main_color_theme_data.dart';
part 'theme/main_text_theme_data.dart';
part 'theme/main_theme_data.dart';

/// MainTheme is a Flutter widget that acts as an inheritable widget
///  to provide a MainThemeData object to its descendants.
/// This MainThemeData object contains information about the color theme
/// and text theme of the app. This information is used to style
///  various parts of the user interface.
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
