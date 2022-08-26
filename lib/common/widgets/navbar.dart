import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beamerState = context.customPageState;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: SitePage.values
            .map((page) => _DestinationWidget(
                  text: page.pageName,
                  onTap: () => beamerState.selectedPage = page,
                  selected: beamerState.selectedPage == page,
                ))
            .toList(),
      ),
    );
  }
}

class _DestinationWidget extends StatelessWidget {
  const _DestinationWidget({
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
        child: Text(text,
            style: TextStyle(
              color: selected ? Colors.white : null,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              shadows: [
                Shadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 1.5,
                  offset: Offset(0,2)

                )
              ]
            ),),
      ),
    );
  }
}
