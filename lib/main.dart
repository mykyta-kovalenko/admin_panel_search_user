import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const App());
}
