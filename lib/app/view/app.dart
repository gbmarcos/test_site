// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/gen/fonts.gen.dart';
import 'package:test_site/l10n/l10n.dart';

import '../../r.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: FontFamily.montserrat,
        scaffoldBackgroundColor: R.colors.backgroundColor,
        colorScheme: ColorScheme.dark(
          primary: R.colors.primaryColor,
        ),
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
