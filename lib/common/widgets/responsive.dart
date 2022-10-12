import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) => context.mediaQuery.size.width <= 440;

  static bool isTablet(BuildContext context) =>
      context.mediaQuery.size.width <= 834 && context.mediaQuery.size.width > 440;

  static bool isDesktop(BuildContext context) => context.mediaQuery.size.width > 834;

  @override
  Widget build(BuildContext context) {
    // If our width is more than 1100 then we consider it a desktop
    if (isDesktop(context)) {
      return desktop;
    }
    // If width it less then 1100 and more then 789 we consider it as tablet
    else if (isTablet(context) && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
