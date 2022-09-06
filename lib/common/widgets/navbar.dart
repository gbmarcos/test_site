import 'dart:developer';
import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({Key? key, this.onSelected}) : super(key: key);

  final void Function(NavigationOption page)? onSelected;

  @override
  Widget build(BuildContext context) {


    final mainPages = [
      NavigationOption.home,
      NavigationOption.uberUns,
      NavigationOption.kompetenzen,
      NavigationOption.vision,
      NavigationOption.news,
      NavigationOption.team,
    ];

    if (!Responsive.isMobile(context)) {
      Navigator.of(context).maybePop();
    }

    return !Responsive.isMobile(context)
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 800,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 8, right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(mainPages.length, (index) {
                      final page = mainPages[index];
                      return _DestinationTextWidget(
                        text: page.pageName,
                        onTap: () {
                          onSelected?.call(page);
                        },
                        selected: false
                      );
                    }),
                    DestinationButtonWidget(
                      text: NavigationOption.karriere.pageName,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton(
                  icon: Assets.icons.menuButton.svg(
                    height: 24,
                    width: 24,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) {
                    return List.generate(mainPages.length, (index) {
                      final page = mainPages[index];
                      return PopupMenuItem<NavigationOption>(
                        onTap: () {
                          onSelected?.call(page);
                        },
                        child: Text(
                          page.pageName,
                          style: TextStyle(
                            color: R.colors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: Responsive.isDesktop(context) ? 16.0 : 14.0,
                            shadows: [
                              Shadow(
                                  color: Colors.black.withAlpha(50),
                                  blurRadius: 1.5,
                                  offset: const Offset(0, 2))
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  elevation: 5,
                  color: Colors.grey.shade900.withOpacity(0.95),
                ),
                DestinationButtonWidget(
                  horizontalMargin: 0,
                  horizontalPadding: 14,
                  text: NavigationOption.karriere.pageName,
                  onTap: () {},
                )
              ],
            ),
          );
  }
}

class _DestinationTextWidget extends StatelessWidget {
  const _DestinationTextWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final fontSize = Responsive.isDesktop(context) ? 16.0 : 14.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: R.colors.primaryColor,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : null,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            shadows: [
              Shadow(color: Colors.black.withAlpha(50), blurRadius: 1.5, offset: const Offset(0, 2))
            ],
          ),
        ),
      ),
    );
  }
}

class DestinationButtonWidget extends StatelessWidget {
  const DestinationButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.selected = false,
    this.horizontalPadding = 27,
    this.horizontalMargin = 8,
    this.backgroundColor,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.opacity = 0.8,
    this.elevation = 3,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool selected;
  final double horizontalPadding;
  final double horizontalMargin;
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double opacity;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final defaultFontSize = Responsive.isDesktop(context) ? 16.0 : 12.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: (selected ? Colors.white : (backgroundColor ?? R.colors.buttonColor))
              .withOpacity(opacity),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(2)),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 18),
          elevation: elevation,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? R.colors.backgroundColor,
            fontWeight: fontWeight ?? R.fontWidths.semiBold,
            overflow: TextOverflow.ellipsis,
            fontSize: fontSize ?? defaultFontSize,
          ),
        ),
      ),
    );
  }
}
