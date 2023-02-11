import 'package:admin_panel_user_search/app.dart';
import 'package:admin_panel_user_search/di/di.dart';
import 'package:admin_panel_user_search/resources/app_strings.dart';
import 'package:admin_panel_user_search/ui/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  configureDependencies();
  testWidgets(
    'End-to-end app test',
    (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(find.text(AppStrings.searchForAUser));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.enterText(
        find.byKey(Key(SearchTabFields.search.name)),
        'Jo',
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(find.text(AppStrings.cancel));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.enterText(
        find.byKey(Key(SearchTabFields.search.name)),
        'John',
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(find.byIcon(Icons.cancel_rounded));
      await tester.pumpAndSettle(const Duration(seconds: 1));
    },
  );
}
