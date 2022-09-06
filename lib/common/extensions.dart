import 'dart:html';

import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/r.dart';

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
