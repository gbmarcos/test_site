import 'package:flutter/material.dart';

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
        fontSize: 64,
        fontWeight: R.fontWidths.semiBold,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get mSMainStyle2 => TextStyle(
        fontSize: 20,
        fontWeight: R.fontWidths.regular,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get mSPageTitleStyle => TextStyle(
        fontSize: 48,
        fontWeight: R.fontWidths.semiBold,
      );

  TextStyle get mSNormalStyle => TextStyle(
        fontSize: 15,
        fontWeight: R.fontWidths.regular,
        color: Colors.black,
      );

  TextStyle get mSHomeCardTitleStyle => TextStyle(
        fontSize: 18,
        fontWeight: R.fontWidths.semiBold,
        color: const Color(0XFFE5DAD3),
      );

  //small screen
  TextStyle get sSMainStyle1 => TextStyle(
        fontSize: 64,
        fontWeight: R.fontWidths.semiBold,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get sSMainStyle2 => TextStyle(
        fontSize: 20,
        fontWeight: R.fontWidths.regular,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 1.8,
            offset: const Offset(0, 4),
          )
        ],
      );

  TextStyle get sSPageTitleStyle => TextStyle(
        fontSize: 48,
        fontWeight: R.fontWidths.semiBold,
      );

  TextStyle get sSNormalStyle => TextStyle(
        fontSize: 15,
        fontWeight: R.fontWidths.regular,
        color: Colors.black,
      );

  TextStyle get sSHomeCardTitleStyle => TextStyle(
        fontSize: 18,
        fontWeight: R.fontWidths.semiBold,
        color: const Color(0XFFE5DAD3),
      );
}

class _AppFontWidth {
  const _AppFontWidth._();

  FontWeight get regular => FontWeight.w300;

  FontWeight get medium => FontWeight.w400;

  FontWeight get semiBold => FontWeight.w500;
}
