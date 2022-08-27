import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/r.dart';

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

    return Padding(
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
          _DestinationButtonWidget(
            text: SitePage.karriere.pageName,
            selected: beamerState.selectedPage == SitePage.karriere,
            onTap: () => beamerState.selectedPage = SitePage.karriere,
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              color: selected ? Colors.white : null,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              shadows: [
                Shadow(
                    color: Colors.black.withAlpha(50), blurRadius: 1.5, offset: const Offset(0, 2))
              ]),
        ),
      ),
    );
  }
}

class _DestinationButtonWidget extends StatelessWidget {
  const _DestinationButtonWidget({
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
        style: TextButton.styleFrom(
          backgroundColor: (selected ? Colors.white : R.colors.buttonColor).withOpacity(0.8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(2)),
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 18),
          elevation: 3
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: R.colors.backgroundColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
