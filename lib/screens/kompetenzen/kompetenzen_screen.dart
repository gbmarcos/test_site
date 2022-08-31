import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

import '../../common/widgets/navbar.dart';

class KompetenzenScreen extends StatelessWidget {
  const KompetenzenScreen({Key? key}) : super(key: key);

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
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.srcOver,
                  ),
                  image: Assets.images.kompetenzenImage1.image().image,
                  fit: BoxFit.cover,
                  scale: 1.3,
                ),
              ),
              child: Column(
                children: const [
                  Navbar(),
                  Expanded(
                    child: KompetenzenContent(),
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


class KompetenzenContent extends StatelessWidget {
  const KompetenzenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Rückabwicklung.',
        style: R.styles.lSMainStyle1,
        textAlign: TextAlign.center,
      ),
    );
  }
}

