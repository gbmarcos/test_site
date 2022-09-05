import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class UberUnsScreen extends StatelessWidget {
  const UberUnsScreen({Key? key}) : super(key: key);

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
                  image: Assets.images.uberUntImage1.image().image,
                  fit: BoxFit.cover,
                  scale: 1.3,
                ),
              ),
              child: Column(
                children: [
                  const NavigationWidget(),
                  if (Responsive.isMobile(context))
                    const Expanded(
                      child: SizedBox.shrink(),
                    ),
                  const Expanded(
                    child: _SectionContent1(),
                  ),
                ],
              ),
            ),
          ),
          const _SectionContent2(),
          const AppForm2(),
          const _SectionContent3(),
          const _SectionContent4(),
        ],
      ),
    );
  }
}

class _SectionContent2 extends StatelessWidget {
  const _SectionContent2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        top: 120,
        bottom: 60,
      ),
      color: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1114,
        ),
        child: MixedCollage(
          image1: Assets.images.mixedCollage1.image().image,
          image2: Assets.images.mixedCollage2.image().image,
          text1: 'Wir bei SYKZ Consulting haben es uns zur '
              'Aufgabe gemacht, den überholten Finanzmarkt in '
              'Deutschland auf den Kopf zu stellen und Ihnen '
              'von der Berufsunfähigkeitsversicherung über '
              'maßgeschneiderte Nischenprodukte bis hin zu '
              'institutionellen Investmentstrategien alles '
              'zur Verfügung zu stellen. Dabei lösen wir '
              'komplexe Themen und Zusammenhänge aller '
              'Mandanten mit höchster Professionalität und '
              'Weitsicht und verschaffen Ihnen auf simple '
              'Art und Weise Zugang zu alternativen Strategien '
              'der Zukunft.',
          text2: '''
Zu unseren Dienstleistungen im Bereich Vermögensschutz und Investment gehören:
 - Sach-, Gewerbe-, und Personenversicherungen
 - Honorarberatung nach §34h für Finanzanlagen
 - Edelmetallsparpläne und Einmalinvestitionen (physisch)
 - Rohstoffe und Industriemetalle
 - Rekreatives medizinisches Cannabis (physisch)
 - Venture Capital ab nur 1.000 € Investition
 - Off Market Investment & Private Sales
 - Devisenhandel
 - Photovoltaik für Privatpersonen und Unternehmen unter Berücksichtigung des IAB (Eigennutzung & Steueroptimierung)
 - Internationale Off-Market Immobilien
 - Finanzierungen (Immobilien, Privatkredite, Kapitalbeschaffung)
          ''',
        ),
      ),
    );
  }
}

class _SectionContent1 extends StatelessWidget {
  const _SectionContent1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Unternehmensberatung.',
          style: context.mainStyle1,
          textAlign: context.mainPageTextAlign,
        ),
      ),
    );
  }
}

class _SectionContent3 extends StatelessWidget {
  const _SectionContent3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(
          left: 163,
          right: 163,
          top: 219,
          bottom: 58,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Anwendungsbeispiele',
                style: R.styles.lSPageSubtitleStyle.copyWith(
                  color: const Color(0xFF414141),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Unternehmensberatung.',
                style: R.styles.lSPageTitleStyle.copyWith(
                  color: const Color(0xFF414141),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: const PhotoCollageWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class _SectionContent4 extends StatelessWidget {
  const _SectionContent4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 155,
        right: 155,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1114,
        ),
        child: const AppForm1(),
      ),
    );
  }
}
