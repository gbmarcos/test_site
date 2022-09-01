import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/r.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beamerState = context.customPageState;

    final mainPages = [
      SitePage.home,
      SitePage.uberUns,
      SitePage.kompetenzen,
      SitePage.vision,
      SitePage.news,
      SitePage.team,
    ];

    return SingleChildScrollView(
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
                  onTap: () => beamerState.selectedPage = page,
                  selected: beamerState.selectedPage == page,
                );
              }),
              DestinationButtonWidget(
                text: SitePage.karriere.pageName,
                selected: beamerState.selectedPage == SitePage.karriere,
                onTap: () => beamerState.selectedPage = SitePage.karriere,
              ),
            ],
          ),
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : null,
            fontWeight: FontWeight.w600,
            fontSize: 16,
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
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool selected;
  final double horizontalPadding;
  final double horizontalMargin;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: (selected ? Colors.white : (backgroundColor ?? R.colors.buttonColor))
                .withOpacity(0.8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(2)),
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 18),
            elevation: 3),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor??R.colors.backgroundColor,
            fontWeight: R.fontWidths.semiBold,
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
