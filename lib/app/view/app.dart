// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/gen/fonts.gen.dart';
import 'package:test_site/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  void didChangeDependencies() {

    precachePicture(Assets.icons.sykzIcon.svg().pictureProvider, context);
    precachePicture(Assets.icons.menuButton.svg().pictureProvider, context);
    precachePicture(Assets.icons.sykzIcon2.svg().pictureProvider, context);
    precachePicture(Assets.icons.instagramIcon.svg().pictureProvider, context);
    precachePicture(Assets.icons.linkedInIcon.svg().pictureProvider, context);
    precachePicture(Assets.icons.metaIcon.svg().pictureProvider, context);


    precacheImage(Assets.images.homeImage1.image().image, context);
    precacheImage(Assets.images.unternehmensberatungImage1.image().image, context);
    precacheImage(Assets.images.ruckabwicklungImage1.image().image, context);
    precacheImage(Assets.images.investmentImage1.image().image, context);



    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: FontFamily.celesta,
        primaryColor: Colors.black
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,

    );
  }
}
