part of '../dark_theme.dart';

const _fontFamily = FontFamily.avenir;

const _defaultText = TextStyle(
  fontSize: 14,
  fontFamily: _fontFamily,
  color: _AppColors.white,
);
const _demiboldText = TextStyle(
  fontSize: 16,
  fontFamily: _fontFamily,
  color: _AppColors.white,
  fontWeight: FontWeight.bold,
);

final _appBarTextStyle = _demiboldText.copyWith(fontSize: 24);

abstract class _AppColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF171717);
  static const appBarBlack = Color(0xFF020202);
  static const statusGreen = Color(0xFF00BA84);
  static const statusRed = Color(0xFFFF004A);
  static const systemBlue = Color(0xFF0084FF);
  static const grey = Color(0xFFEBEBF5);
  static const darkGrey = Color(0xFF2C2D30);
}
