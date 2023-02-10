part of '../dark_theme.dart';

class _DarkTextThemeData implements MainTextThemeData {
  const _DarkTextThemeData();

  @override
  TextStyle get defaultText => _defaultText;

  @override
  TextStyle get demiboldText => _demiboldText;

  @override
  TextStyle get searchField => _defaultText.copyWith(
        fontSize: 17,
        letterSpacing: -0.41,
      );

  @override
  TextStyle get cancel => _defaultText.copyWith(
        fontSize: 17,
        letterSpacing: -0.41,
        color: _AppColors.systemBlue,
      );
}
