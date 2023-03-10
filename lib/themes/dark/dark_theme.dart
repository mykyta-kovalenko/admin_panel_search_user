import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import '../main_theme.dart';

part 'src/color_theme.dart';
part 'src/constants.dart';
part 'src/text_theme.dart';
part 'src/theme_data.dart';

class DarkThemeData extends MainThemeData {
  DarkThemeData()
      : super(
          themeData: _createTheme(),
          textTheme: const _DarkTextThemeData(),
          colorTheme: const _DarkColorThemeData(),
        );
}
