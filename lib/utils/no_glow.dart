import 'package:flutter/cupertino.dart';

/// This class is used to remove the glow effect that appears around
/// the scrollable area when the user scrolls to the edge of the content.
class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
