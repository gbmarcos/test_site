import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

import '../../common/widgets/navbar.dart';

class KarriereScreen extends StatelessWidget {
  const KarriereScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = context.mediaQuery;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: mediaQuery.size.height,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Assets.images.newsTeamKarriereImage1.image().image,
                  fit: BoxFit.cover,
                  scale: 1.3,
                ),
              ),
              child: Column(
                children: const [
                  Navbar(),
                  Expanded(
                    child: KarriereContent(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: mediaQuery.size.height,
            color: Colors.white,
          ),
          SizedBox(
            height: mediaQuery.size.height,
          ),
        ],
      ),
    );
  }
}

class KarriereContent extends StatelessWidget {
  const KarriereContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Offene Stellenangebote',
            style: R.styles.lSMainStyle1,
            textAlign: TextAlign.center,
          ),
          Text(
            'Du hast Lust, Teil unseres Teams zu werden? Dann bewirb dich jetzt bei uns!',
            style: R.styles.lSMainStyle2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
