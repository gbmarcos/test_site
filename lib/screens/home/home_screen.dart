import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:test_site/r.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/screens/screens.dart';
import '../../common/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    const Color(0xFF7D7A7A).withOpacity(0.7),
                    BlendMode.srcOver,
                  ),
                  image: Assets.images.homeImage1.image().image,
                  fit: BoxFit.cover,
                  scale: 1.3,
                ),
              ),
              child: Column(
                children: const [
                  Navbar(),
                  Expanded(
                    child: HomeFirstSectionContent(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 80),
            decoration: BoxDecoration(
              color: Color.alphaBlend(
                R.colors.maskColor1.withOpacity(0.5),
                Colors.white,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Wie viel Zeit ist genug Zeit?',
                    textAlign: TextAlign.center,
                    style: R.styles.lSPageTitleStyle.copyWith(color: R.colors.backgroundColor),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 922),
                    child: Text(
                      '''
Mit dieser Frage beschäftigen wir uns nun schon lange - und sie hat uns bisher nicht losgelassen.
Der Wunsch, unseren Mandanten mehr persönliche, berufliche und finanzielle Freiheit zu ermöglichen, ist das was uns antreibt. Mit unserer individuellen Betreuung entwickeln wir ganzheitliche Strategien, die zu unseren Mandanten passen. Dabei legen wir vor allem Wert auf den kontinuierlichen, persönlichen Austausch. 
Indem wir eng mit unseren Mandanten zusammenarbeiten, finden wir heraus, was sie wirklich bewegt. Dabei haben wir eine zentrale Sache herausgefunden: 
Wir haben einen angestellten Maschinenbauingenieur, einen Apotheker und einen Konzerninhaber gefragt, was Ihnen in der Zusammenarbeit mit uns wichtig ist und welche Strategie wir gemeinsam verfolgen wollen. Alle gaben uns intuitiv dieselbe Antwort.
„Zeit - wir wollen mehr Zeit haben.“
Danach haben wir mit unserem Expertenteam die einzigartige hourglass investment strategy entwickelt, die uns und unseren Mandanten noch besser und effektiver dabei hilft, ihre Motive und Bedürfnisse zu verstehen.                        
                      ''',
                      textAlign: TextAlign.center,
                      style: R.styles.lSNormalStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 955,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlexibleConstrainedBox(
                          maxWidth: 240,
                          child: Assets.images.rowImage1.image(
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        FlexibleConstrainedBox(
                          maxWidth: 240,
                          child: Assets.images.rowImage2.image(
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        FlexibleConstrainedBox(
                          maxWidth: 240,
                          child: Assets.images.rowImage3.image(
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 582,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Assets.images.homeImage2.image().image,
                  fit: BoxFit.cover,
                  scale: 1.3,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 847),
                        child: Text(
                          'Das Leben von morgen schon heute gestalten.',
                          style: R.styles.lSMainStyle1.copyWith(fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 29),
                      Padding(
                        padding: const EdgeInsets.only(right: 65),
                        child: Text(
                          '- mit SYKZ',
                          style: TextStyle(
                            fontWeight: R.fontWidths.regular,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 63, bottom: 154),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Über uns',
                    textAlign: TextAlign.center,
                    style: R.styles.lSPageTitleStyle.copyWith(
                      color: const Color(0XFFB0D9C0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 922),
                    child: Text(
                      '''
Wir helfen Angestellten, Selbstständigen und Unternehmern dabei, mit Investment- und Steuerstrategien mehr Geld zu sparen, dieses intelligent zu reinvestieren und so frühzeitig nachhaltigen Wohlstand aufzubauen - so können unsere Mandanten ihren gewünschten Ruhestand mit unserer Hilfe steuern. 
Außerdem beraten wir unsere Mandanten fortlaufend in strategischen Zielsetzungen, bei der Optimierung interner Prozesse und dem Schaffen neuer Werte.

Wir legen viel Wert auf die Auswahl unserer Kooperationspartner. Dabei achten wir insbesondere auf Integrität, kurze Kommunikationsstrecken, professionelle und effiziente Arbeitsprozesse und ein vertrauensvolles Verhältnis.
Auch das Thema Data Safety wird bei uns groß geschrieben: Wir gehen beim Umgang mit sensiblen Daten mit höchstem Verantwortungsbewusstsein vor.
Jetzt Strategie Termin vereinbaren.
                      ''',
                      textAlign: TextAlign.center,
                      style: R.styles.lSNormalStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 1114,
                    ),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlexibleConstrainedBox(
                              maxWidth: 358,
                              child: CustomCard(
                                topPadding: 160,
                                background: Assets.images.staggeredRowImage1.image(
                                  height: 500,
                                  fit: BoxFit.cover,
                                ),
                                title: 'Unternehmensberatung',
                                buttonText: 'Jetzt mehr erfahren',
                              ),
                            ),
                            const SizedBox(width: 10),
                            FlexibleConstrainedBox(
                              maxWidth: 358,
                              child: CustomCard(
                                topPadding: 80,
                                background: Assets.images.staggeredRowImage2.image(
                                  height: 500,
                                  fit: BoxFit.cover,
                                ),
                                title: 'Rückabwicklung',
                                buttonText: 'Jetzt mehr erfahren',
                              ),
                            ),
                            const SizedBox(width: 10),
                            FlexibleConstrainedBox(
                              maxWidth: 358,
                              child: CustomCard(
                                topPadding: 0,
                                background: Assets.images.staggeredRowImage1.image(
                                  height: 500,
                                  fit: BoxFit.cover,
                                ),
                                title: 'Investment & Vermögensschutz',
                                buttonText: 'Jetzt mehr erfahren',
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            'Kompetenzen',
                            style: R.styles.lSPageTitleStyle.copyWith(
                              color: const Color(0XFFE6D1E5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 60, right: 60),
            color: const Color(0XFF1A1A1A),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Assets.images.rotatedImage.svg(width: 333),
                ),
                const SizedBox(width: 20),
                DefaultTextStyle(
                  style: R.styles.lSPageTitleStyle.copyWith(
                    color: const Color(0XFFFCDFCF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 84),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('SYKZ'),
                          Text('hourglass'),
                          Text('strategy'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 38),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 38),
                    child: Text(
                      '''
Mit der SYKZ hourglass strategy verfolgen wir eine ganzheitlich neue Herangehensweise in der Finanzberatung. Uns ist aufgefallen, dass bei der Analyse unserer Mandanten ein Thema immer wieder in den Fokus rückt. Bei der Frage, was unseren Mandanten in der Beratung am wichtigsten ist, kommt fast immer die selbe Antwort: Zeit. Deswegen haben wir es uns zur Aufgabe gemacht, diese knappe und unwiederbringliche Ressource zu unserem Hauptaugenmerk in der Betreuung unserer Mandanten zu machen:
Mehr Zeit für Familie. Mehr Zeit für die eine Reise, die schon seit Jahren passieren sollte. Mehr Zeit, um das Leben sorgenfrei auszuschöpfen.
                      ''',
                      textAlign: TextAlign.start,
                      style: R.styles.lSNormalStyle.copyWith(
                        fontWeight: R.fontWidths.medium,
                        color: const Color(0XFFB8B8B8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlexibleConstrainedBox extends StatelessWidget {
  const FlexibleConstrainedBox({
    Key? key,
    required this.maxWidth,
    required this.child,
    this.flex = 1,
  }) : super(key: key);

  final int flex;
  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.background,
    required this.title,
    required this.buttonText,
    required this.topPadding,
  });

  final Widget background;
  final String title;
  final String buttonText;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: topPadding,
            ),
            Stack(
              children: [
                background,
                Positioned(
                  left: 18,
                  top: 21,
                  right: 18,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: constraint.maxWidth,
                    child: Text(
                      title,
                      style: R.styles.lSHomeCardTitleStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 22,
                  right: 15,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: constraint.maxWidth,
                    child: DestinationButtonWidget(
                      backgroundColor: const Color(0XFFB4B4B4).withOpacity(0.8),
                      textColor: const Color(0XFFF5F2F0),
                      horizontalPadding: 11,
                      text: buttonText,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class HomeFirstSectionContent extends StatelessWidget {
  const HomeFirstSectionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 139,
        child: PlayAnimationBuilder<double>(
          curve: Curves.decelerate,
          tween: Tween(begin: 0, end: 1), // 100.0 to 200.0
          duration: const Duration(milliseconds: 800),
          builder: (context, value, _) {
            const translationFactor = 150;
            final translationValue = translationFactor - (value * translationFactor);

            return Opacity(
              opacity: value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(-translationValue, 0),
                    child: Assets.icons.sykzIcon.svg(
                      height: 68.74,
                      width: 210,
                    ),
                  ),
                  VerticalDivider(
                    color: R.colors.iconsColor,
                    width: 46,
                  ),
                  Transform.translate(
                    offset: Offset(translationValue, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DestinationButtonWidget(
                          horizontalMargin: 0,
                          horizontalPadding: 12,
                          selected: false,
                          onTap: () {},
                          text: 'Strategie Termin',
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Assets.icons.instagramIcon.svg(
                              height: 15,
                              width: 15,
                            ),
                            const SizedBox(width: 20),
                            Assets.icons.linkedInIcon.svg(
                              height: 15,
                              width: 15,
                            ),
                            const SizedBox(width: 20),
                            Assets.icons.metaIcon.svg(
                              height: 15,
                              width: 73.75,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          'DESIRE. CREATE. INSPIRE.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: R.colors.sloganColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
