import 'package:flutter/material.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/custom_forms.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

import '../../common/widgets/common_widgets.dart';
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
                children: [
                  NavigationWidget(
                    onSelected: (page) {
                      onNavigationActionSelect(
                        page: page,
                        context: context,
                      );
                    },
                  ),
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
          const SectionWithImageCollage(
            title: 'Prozessoptimierung.',
            subtitle: 'Anwendungsbeispiele',
          ),
          const _SectionContent4(),
        ],
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
          'Rückabwicklung.',
          style: context.mainStyle1,
          textAlign: context.mainPageTextAlign,
        ),
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
    final padding = Responsive.isDesktop(context)
        ? const EdgeInsets.only(
            left: 50,
            right: 50,
            top: 120,
            bottom: 60,
          )
        : Responsive.isTablet(context)
            ? const EdgeInsets.only(
                top: 70,
                bottom: 100,
              )
            : const EdgeInsets.only(
                top: 5,
                bottom: 84,
              );

    return Container(
      padding: padding,
      color: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1114,
        ),
        child: MixedCollage(
          image1: Assets.images.mixedCollage3.image().image,
          image2: Assets.images.mixedCollage4.image().image,
          text1: '''
Unseren zweiten Kernbereich stellt das Thema Rückabwicklung dar.
Sie haben einen alten, noch laufenden Vertrag aus den folgenden Kategorien und fragen sich, ob dieser überhaupt noch zeitgemäß, geschweige denn verbraucherschutzkonform ist?
 - Lebens- und Rentenversicherungen
 - Bausparverträge
 - Riester-Verträge
 - Unfallversicherungen mit Beitragsrückgewähr
 - staatlich geförderte Zukunftsvorsorgen
 - betriebliche Altersvorsorgen
 - Über das zur Unternehmensgruppe gehörende Unternehmen LIQIDA helfen wir Ihnen, Ihre Verträge zu prüfen.
          ''',
          text2: '''
Welche Vorteile hat diese Dienstleistung konkret für Sie?
Statt einer Kündigung lösen wir den Vertrag für Sie auf, wenn die Prüfung ergibt, dass der geschlossene Vertrag fehlerhaft oder sogar rechtswidrig ist. Dadurch vermeiden Sie Strafgebühren und eine unnötig hohe Steuerlast, die bei einer klassischen Kündigung entstehen würde.
Bei vollständigem Einreichen der benötigten Unterlagen bekommen Sie bereits binnen 18 Tagen das eingelegte Geld aus Ihrem Vertrag ausgezahlt (Option 1).
Wir empfehlen hier jedoch, mit einer unserer Anlagestrategien den Rückkaufswert direkt beim Einreichen der Unterlagen zu reinvestieren, sodass Ihr Vermögen fortan wirklich für Sie arbeiten kann (Option 2).
Nach der Rückabwicklung wird über einen Zeitraum von sechs bis 24 Monaten der Vertrag und dessen AGB erneut durch Rechtsanwälte geprüft. 50% unserer Kunden werden nach dieser Prüfung im Durchschnitt noch einmal zusätzlich zwischen 10 und 20 % Ihres Rückkaufswertes ausgeschüttet.
Wie das funktioniert, erklären wir Ihnen gerne in einer persönlichen Beratung mit uns.
          ''',
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
                'Prozessoptimierung.',
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
    final horizontalPadding = Responsive.isDesktop(context)
        ? 155.0
        : Responsive.isTablet(context)
            ? 80.0
            : 36.0;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        top: 59,
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
