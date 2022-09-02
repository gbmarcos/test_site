import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/navbar.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

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
                    child: TeamContent(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamContent extends StatelessWidget {
  const TeamContent({Key? key}) : super(key: key);

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
