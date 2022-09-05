import 'package:flutter/material.dart';
import 'package:test_site/common/widgets/common_widgets.dart';

class R {
  const R._();

  static _AppColors get colors => const _AppColors._();

  static _AppStyles get styles => const _AppStyles._();

  static _AppFontWidth get fontWidths => const _AppFontWidth._();
}

class _AppColors {
  const _AppColors._();

  Color get primaryColor => const Color(0xFFC8E2F4);

  Color get buttonColor => const Color(0xFFBDDDF6);

  Color get backgroundColor => const Color(0xFF535D64);

  Color get iconsColor => const Color(0xFFD0E3D8);

  Color get textColor1 => const Color(0xFFFFFFFF);

  Color get textColor2 => const Color(0xFFD0E3D8);

  Color get sloganColor => const Color(0xFFB2CBDD);

  Color get maskColor1 => const Color(0xFFB2CBDD);

  Color get maskColor2 => const Color(0xFFFCDFCF);

  Color get roundedHeaderColor => const Color(0xFF9CB6CA);
}

class _AppStyles {
  const _AppStyles._();

  //large screen
  TextStyle get lSMainStyle1 => TextStyle(
        fontSize: 64,
        fontWeight: R.fontWidths.semiBold,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get lSMainStyle2 => TextStyle(
        fontSize: 20,
        fontWeight: R.fontWidths.regular,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get lSPageTitleStyle => TextStyle(
        fontSize: 48,
        fontWeight: R.fontWidths.semiBold,
      );

  TextStyle get lSPageSubtitleStyle => TextStyle(
        fontSize: 36,
        fontWeight: R.fontWidths.light,
      );

  TextStyle get lSNormalStyle => TextStyle(
        fontSize: 15,
        fontWeight: R.fontWidths.medium,
        color: Colors.black,
        height: 2,
      );

  TextStyle get lSHomeCardTitleStyle => TextStyle(
        fontSize: 18,
        fontWeight: R.fontWidths.semiBold,
        color: const Color(0XFFE5DAD3),
      );

  //medium screen
  TextStyle get mSMainStyle1 => TextStyle(
        fontSize: 36,
        fontWeight: R.fontWidths.semiBold,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get mSMainStyle2 => TextStyle(
        fontSize: 12,
        fontWeight: R.fontWidths.regular,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get mSPageTitleStyle => TextStyle(
        fontSize: 32,
        fontWeight: R.fontWidths.semiBold,
      );

  TextStyle get mSPageSubtitleStyle => TextStyle(
        fontSize: 36,
        fontWeight: R.fontWidths.light,
      );

  TextStyle get mSNormalStyle => TextStyle(
        fontSize: 11,
        fontWeight: R.fontWidths.regular,
        color: Colors.black,
        height: 2,
      );

  TextStyle get mSHomeCardTitleStyle => TextStyle(
        fontSize: 12,
        fontWeight: R.fontWidths.semiBold,
        color: const Color(0XFFE5DAD3),
      );

  //small screen
  TextStyle get sSMainStyle1 => TextStyle(
        fontSize: 34,
        fontWeight: R.fontWidths.semiBold,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get sSMainStyle2 => TextStyle(
        fontSize: 12,
        fontWeight: R.fontWidths.regular,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get sSPageTitleStyle => TextStyle(
        fontSize: 32,
        fontWeight: R.fontWidths.semiBold,
      );

  TextStyle get sSPageSubtitleStyle => TextStyle(
        fontSize: 36,
        fontWeight: R.fontWidths.light,
      );

  TextStyle get sSNormalStyle => TextStyle(
        fontSize: 11,
        fontWeight: R.fontWidths.regular,
        color: Colors.black,
        height: 2,
      );

  TextStyle get sSHomeCardTitleStyle => TextStyle(
        fontSize: 12,
        fontWeight: R.fontWidths.semiBold,
        color: const Color(0XFFE5DAD3),
      );
}

class _AppFontWidth {
  const _AppFontWidth._();

  FontWeight get light => FontWeight.w200;

  FontWeight get regular => FontWeight.w300;

  FontWeight get medium => FontWeight.w400;

  FontWeight get semiBold => FontWeight.w500;

  FontWeight get bold => FontWeight.w600;
}
