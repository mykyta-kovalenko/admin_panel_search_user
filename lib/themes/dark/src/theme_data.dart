part of '../dark_theme.dart';

ThemeData _createTheme() {
  final appBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    color: _AppColors.appBarBlack,
    titleTextStyle: _appBarTextStyle,
  );

  final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );

  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  );

  final inputDecorationTheme = InputDecorationTheme(
    filled: true,
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    fillColor: _AppColors.darkGrey,
    focusedBorder: outlineInputBorder,
    contentPadding: const EdgeInsets.all(0),
    constraints: const BoxConstraints(maxHeight: 36),
    prefixIconColor: _AppColors.grey.withOpacity(0.6),
    hintStyle: TextStyle(
      letterSpacing: -0.41,
      color: _AppColors.grey.withOpacity(0.6),
    ),
  );

  final themeData = ThemeData(
    appBarTheme: appBarTheme,
    textButtonTheme: textButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
    scaffoldBackgroundColor: _AppColors.black,
  );

  return themeData;
}
