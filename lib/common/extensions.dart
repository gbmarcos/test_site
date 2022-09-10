import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/r.dart';
import 'package:visibility_detector/visibility_detector.dart';

extension BuilContextX on BuildContext {
  CustomPageState get customPageState => currentBeamLocation.state as CustomPageState;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  TextAlign get mainPageTextAlign => Responsive.isMobile(this) ? TextAlign.start : TextAlign.center;

  TextStyle get mainStyle1 => Responsive.isDesktop(this)
      ? R.styles.lSMainStyle1
      : Responsive.isTablet(this)
          ? R.styles.mSMainStyle1
          : R.styles.sSMainStyle1;

  TextStyle get mainStyle2 => Responsive.isDesktop(this)
      ? R.styles.lSMainStyle2
      : Responsive.isTablet(this)
          ? R.styles.mSMainStyle2
          : R.styles.sSMainStyle2;

  TextStyle get pageTitleStyle => Responsive.isDesktop(this)
      ? R.styles.lSPageTitleStyle
      : Responsive.isTablet(this)
          ? R.styles.mSPageTitleStyle
          : R.styles.sSPageTitleStyle;

  TextStyle get normalStyle => Responsive.isDesktop(this)
      ? R.styles.lSNormalStyle
      : Responsive.isTablet(this)
          ? R.styles.mSNormalStyle
          : R.styles.sSNormalStyle;

  TextStyle get homeCardTitleStyle => Responsive.isDesktop(this)
      ? R.styles.lSHomeCardTitleStyle
      : Responsive.isTablet(this)
          ? R.styles.mSHomeCardTitleStyle
          : R.styles.sSHomeCardTitleStyle;

  TextStyle get pageSubtitleStyle => Responsive.isDesktop(this)
      ? R.styles.lSPageSubtitleStyle
      : Responsive.isTablet(this)
          ? R.styles.mSPageSubtitleStyle
          : R.styles.sSPageSubtitleStyle;

  double get generalHorizontalPadding => Responsive.isDesktop(this)
      ? 100.0
      : Responsive.isTablet(this)
          ? 80.0
          : 30.0;
}

extension VisibilityInfoX on VisibilityInfo {
  double normalizedFraction(BuildContext context) {
    final screenHeight = context.mediaQuery.size.height;

    if (visibleFraction == 0) return 0;

    final maxWidgetHeight = (1 / visibleFraction) * visibleBounds.height;

    if (maxWidgetHeight == 0) return 0;

    var maxFraction = screenHeight / maxWidgetHeight;
    if (maxFraction > 1) {
      maxFraction = 1;
    }

    if (maxFraction == 0) return 0;

    final result = visibleFraction / maxFraction;
    return result > 1 ? 1 : result;
  }
}
