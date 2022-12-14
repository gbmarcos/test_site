import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/common/widgets/custom_animated_text.dart';
import 'package:test_site/common/widgets/custom_scrollable_positioned_list.dart';
import 'package:test_site/common/widgets/trapeze_container.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/gen/fonts.gen.dart';
import 'package:test_site/r.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final sections = [
    LayoutBuilder(builder: (context, _) {
      return SizedBox(
        height: context.mediaQuery.size.height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                const Color(0xFF7D7A7A).withOpacity(0.3),
                BlendMode.srcOver,
              ),
              image: Assets.images.homeImage1.image().image,
              fit: BoxFit.cover,
              scale: 1.3,
            ),
          ),
          child: Column(
            children: [
              NavigationWidget(
                onSelected: (page) async {
                  itemScrollController.jumpTo(
                    index: itemPositionsListener.itemPositions.value.first.index,
                    alignment: itemPositionsListener.itemPositions.value.first.itemLeadingEdge,
                  );
                  await itemScrollController.scrollTo(
                    index: page.scrollIndex,
                    alignment: -0.0001,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOutCubic,
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
      );
    }),
    const _SectionContent2(),
    const _SectionContent3(),
    const _UberUnsSection(),
    const _KompetenzenSection(),
    const _SectionContent5(),
    const _SectionContent6(),
    const _SectionContent7(),
    const _VisionSection(),
    const _TeamSection(),
    const _SectionContent8(),
    const _SectionContent9(),
    const CustomFooter(),
  ];

  late final ItemScrollController itemScrollController = ItemScrollController();
  late final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create()
    ..itemPositions.addListener(() {
      VisibilityDetectorController.instance.notifyNow();
    });

  @override
  Widget build(BuildContext context) => CustomScrollablePositionedList(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        sections: sections,
      );
}

class _TeamSection extends StatelessWidget {
  const _TeamSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.isDesktop(context)
        ? 155.0
        : Responsive.isTablet(context)
            ? 80.0
            : 36.0;

    final padding = EdgeInsets.only(
      left: horizontalPadding,
      right: horizontalPadding,
      top: 59,
    );

    final photoSize = Responsive.isDesktop(context)
        ? const Size(358, 500)
        : Responsive.isTablet(context)
            ? const Size(269, 374)
            : const Size(374, 523);

    return ColoredBox(
      color: Colors.white,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: padding,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1114,
            ),
            child: Text(
              'Team',
              style: context.pageTitleStyle.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (!Responsive.isMobile(context))
          Container(
            padding: padding,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlexibleConstrainedBox(
                    maxWidth: photoSize.width,
                    child: TeamMemberCard(
                      memberPhoto: Assets.images.member1.image(
                        height: photoSize.height,
                        fit: BoxFit.cover,
                      ),
                      name: 'Yannick Klaiber',
                      roll: 'Gesch??ftsf??hrer',
                      phone: '+49 151 23294239',
                      email: 'y.klaiber@sykz.de',
                    ),
                  ),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                    maxWidth: photoSize.width,
                    child: TeamMemberCard(
                      memberPhoto: Assets.images.member2.image(
                        height: photoSize.height,
                        fit: BoxFit.cover,
                      ),
                      name: 'Shayan Zare',
                      roll: 'Gesch??ftsf??hrer',
                      phone: '+49 152 11448643',
                      email: 's.zare@sykz.de',
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TeamMemberCard(
                memberPhoto: Assets.images.member1.image(
                  height: photoSize.height,
                  width: photoSize.width,
                  fit: BoxFit.cover,
                ),
                name: 'Yannick Klaiber',
                roll: 'Gesch??ftsf??hrer',
                phone: '+49 151 23294239',
                email: 'y.klaiber@sykz.de',
              ),
              const SizedBox(height: 10),
              TeamMemberCard(
                memberPhoto: Assets.images.member2.image(
                  height: photoSize.height,
                  width: photoSize.width,
                  fit: BoxFit.cover,
                ),
                name: 'Shayan Zare',
                roll: 'Gesch??ftsf??hrer',
                phone: '+49 152 11448643',
                email: 's.zare@sykz.de',
              ),
            ],
          ),
      ]),
    );
  }
}

class _VisionSection extends StatefulWidget {
  const _VisionSection({Key? key}) : super(key: key);

  @override
  State<_VisionSection> createState() => _VisionSectionState();
}

class _VisionSectionState extends State<_VisionSection> {
  final visibilityNotifier = ValueNotifier<double>(1);

  @override
  Widget build(BuildContext context) {
    final vision = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          Responsive.isMobile(context) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          'Vision',
          style: context.pageTitleStyle.copyWith(
            color: const Color(0xFFC5BBDE),
          ),
        ),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Perspektive. ',
                style: context.normalStyle.copyWith(fontWeight: R.fontWidths.bold),
              ),
              TextSpan(
                text: '''
Unser Anspruch an uns selbst und an unsere Dienstleistungen sollte schon immer in der Ganzheitlichkeit liegen.
Um die Bed??rfnisse der Mandanten zu ermitteln, geh??rt f??r uns daher ein umfangreiches Kennenlernen dazu. Wir m??chten nicht nur der Partner f??r Ihre Finanzen und Ihre Unternehmensberatung sein - wir m??chten jeden Mandanten auf pers??nlicher Ebene verstehen lernen, um so seine Individualit??t zu w??rdigen. Dies sch??tzen unsere Mandanten sehr.
Unser Fokus liegt auf Exklusivit??t. 
Bei  SYKZ arbeiten wir mit Menschen zusammen, nicht mit Zahlen. Daher schauen auch wir bei jedem Erstgespr??ch, ob Sie zu uns passen.
                      ''',
                style: context.normalStyle,
              ),
            ],
          ),
          textAlign: Responsive.isMobile(context) ? TextAlign.left : TextAlign.right,
        )
      ],
    );
    final mission = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mission',
          style: context.pageTitleStyle.copyWith(
            color: const Color(0xFFB2D9C0),
          ),
        ),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Innovation. ',
                style: context.normalStyle.copyWith(fontWeight: R.fontWidths.bold),
              ),
              TextSpan(
                text: '''
Hochkomplexe Themen in Nischenm??rkten jedem zug??nglich zu machen, der es wertsch??tzen kann - das ist unsere Passion. Wir machen keine klassische Finanz- und Unternehmensberatung. Wir schaffen wirkliche Werte. 
Wie wir das tun? Weil wir hinter die Fassade schauen. Indem wir die richtigen Fragen stellen, finden wir f??r Sie die richtigen Antworten.
                        ''',
                style: context.normalStyle,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );

    final horizontalPadding = Responsive.isDesktop(context)
        ? 155.0
        : Responsive.isTablet(context)
            ? 80.0
            : 36.0;

    final padding = EdgeInsets.only(
      left: horizontalPadding,
      right: horizontalPadding,
      top: 59,
    );

    return Container(
      padding: padding,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1114,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (Responsive.isMobile(context))
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  vision,
                  const SizedBox(height: 60),
                  mission,
                ],
              )
            else
              VisibilityDetector(
                key: const Key('vision'),
                onVisibilityChanged: (visibilityInfo) {
                  final visibleBounds = visibilityInfo.visibleBounds;

                  final normalizedFraction = visibilityInfo.normalizedFraction(context);

                  if (!visibleBounds.isEmpty) {
                    visibilityNotifier.value = visibleBounds.top > 0 ? 1 : normalizedFraction;
                  }
                },
                child: ValueListenableBuilder(
                    valueListenable: visibilityNotifier,
                    builder: (context, animationValue, _) {
                      const maxTranslateValue = 90;

                      final translateProgress =
                          maxTranslateValue - (maxTranslateValue * animationValue);

                      return Opacity(
                        opacity: animationValue,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Transform.translate(
                                offset: Offset(-translateProgress, 0),
                                child: vision,
                              ),
                            ),
                            const SizedBox(width: 100),
                            Expanded(
                              child: Transform.translate(
                                offset: Offset(translateProgress, 0),
                                child: mission,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class _SectionContent8 extends StatelessWidget {
  const _SectionContent8({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.isDesktop(context)
        ? 155.0
        : Responsive.isTablet(context)
            ? 80.0
            : 36.0;

    final padding = EdgeInsets.only(
      left: horizontalPadding,
      right: horizontalPadding,
      top: 59,
    );

    final appIconSize = Responsive.isDesktop(context) ? const Size(201, 66) : const Size(138, 45);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: padding,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1114,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 116),
                Text(
                  'Dein Weg mit',
                  style: context.pageTitleStyle.copyWith(
                    color: Colors.black,
                    fontWeight: R.fontWidths.regular,
                    fontFamily: FontFamily.celesta
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Assets.icons.sykzIcon2.svg(
                    height: appIconSize.height,
                    width: appIconSize.width,
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _SectionContent9 extends StatelessWidget {
  const _SectionContent9({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.isDesktop(context)
        ? 155.0
        : Responsive.isTablet(context)
            ? 80.0
            : 36.0;

    final padding = EdgeInsets.only(
      left: horizontalPadding,
      right: horizontalPadding,
      top: 59,
    );

    return Container(
      padding: padding,
      decoration: const BoxDecoration(
        color: Colors.white,
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

class _SectionContent7 extends StatefulWidget {
  const _SectionContent7({
    Key? key,
  }) : super(key: key);

  @override
  State<_SectionContent7> createState() => _SectionContent7State();
}

class _SectionContent7State extends State<_SectionContent7> {
  final visibilityNotifier = ValueNotifier<double>(1);

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.isDesktop(context)
        ? const EdgeInsets.only(
            left: 163,
            right: 163,
            top: 30,
            bottom: 58,
          )
        : Responsive.isTablet(context)
            ? const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 26,
                bottom: 60,
              )
            : const EdgeInsets.only(
                top: 26,
                bottom: 33,
              );

    return VisibilityDetector(
      key: const Key('_SectionContent7'),
      onVisibilityChanged: (visibilityInfo) {
        final visibleBounds = visibilityInfo.visibleBounds;

        final normalizedFraction = visibilityInfo.normalizedFraction(context);

        if (!visibleBounds.isEmpty) {
          visibilityNotifier.value = visibleBounds.top > 0 ? 1 : normalizedFraction;
        }
      },
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Color.alphaBlend(
            R.colors.maskColor2.withOpacity(0.5),
            Colors.white,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Referenzen',
              style: context.pageTitleStyle.copyWith(color: const Color(0xFF9189A7)),
            ),
            const SizedBox(
              height: 50,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: ValueListenableBuilder<double>(
                valueListenable: visibilityNotifier,
                builder: (context, value, _) {
                  return PhotoCollageWidget(
                    animationValue: value,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SectionContent6 extends StatelessWidget {
  const _SectionContent6({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.isDesktop(context) ? 163.0 : 80.0;
    final verticalPadding = Responsive.isDesktop(context) ? 105.0 : 65.0;

    const boxColor = Color(0XFFC4C4C4);

    final boxSize = Responsive.isDesktop(context) ? const Size(358, 120) : const Size(215, 73);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1114,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Partner',
              style: context.pageTitleStyle.copyWith(color: Colors.black),
            ),
            Text(
              '''
VERTRAUEN. Wir beleuchten alle Kooperationspartner immer auf zweierlei Art. 
Unser Team, das sich durch jahrelange Erfahrung auszeichnet, sorgt durch strategische Unternehmensanalysen nicht nur f??r maximale Sicherheit und Transparenz in der Auswahl unserer Partner - uns ist es ebenso wichtig, eine Unternehmenskultur auf Augenh??he zu leben. Daher kennen wir die Inhaber unserer Partnerunternehmen stets pers??nlich.
            ''',
              style: context.normalStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Responsive.isDesktop(context) ? 45 : 20,
            ),
            if (Responsive.isMobile(context))
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 85,
                    child: Assets.icons.liqida1.image(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 73,
                    child: Assets.icons.futurePromition.svg(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 73,
                    child: Assets.icons.jcLogo.svg(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 120,
                    child: Assets.images.forwardV.svg(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 73,
                    child: Assets.images.mosaikIcon.svg(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 90,
                    child: Assets.icons.taavasLogo.svg(),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlexibleConstrainedBox(
                    maxWidth: boxSize.width,
                    child: Center(
                      child: SizedBox(
                        height: boxSize.height,
                        child: Assets.icons.liqida1.image(
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                    maxWidth: boxSize.width,
                    child: Center(
                      child: SizedBox(
                        height: boxSize.height,
                        child: Assets.icons.futurePromition.svg(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                    maxWidth: boxSize.width,
                    child: Center(
                      child: SizedBox(
                        height: boxSize.height,
                        child: Assets.icons.jcLogo.svg(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                    maxWidth: boxSize.width,
                    child: Center(
                      child: SizedBox(
                        height: boxSize.height,
                        child: Assets.images.forwardV.svg(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                    maxWidth: boxSize.width,
                    child: Center(
                      child: SizedBox(
                        height: boxSize.height,
                        child: Assets.images.mosaikIcon.svg(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                    maxWidth: boxSize.width,
                    child: Center(
                      child: SizedBox(
                        height: boxSize.height,
                        child: Assets.icons.taavasLogo.svg(),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _SectionContent5 extends StatelessWidget {
  const _SectionContent5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidth = Responsive.isDesktop(context) ? 333.0 : 203.0;

    final horizontalPadding = Responsive.isMobile(context) ? 30.0 : 60.0;

    final image = Assets.images.rotatedImage.svg(width: imageWidth);

    final text1 = DefaultTextStyle(
      style: context.pageTitleStyle.copyWith(
        color: const Color(0XFFFCDFCF),
        fontFamily: FontFamily.celesta
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            Responsive.isMobile(context) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: const [
          Text('SYKZ'),
          Text('hourglass'),
          Text('strategy'),
        ],
      ),
    );

    final text2 = Text(
      '''
Mit der SYKZ hourglass strategy verfolgen wir eine ganzheitlich neue Herangehensweise in der Finanzberatung. Uns ist aufgefallen, dass bei der Analyse unserer Mandanten ein Thema immer wieder in den Fokus r??ckt. Bei der Frage, was unseren Mandanten in der Beratung am wichtigsten ist, kommt fast immer die selbe Antwort: Zeit. Deswegen haben wir es uns zur Aufgabe gemacht, diese knappe und unwiederbringliche Ressource zu unserem Hauptaugenmerk in der Betreuung unserer Mandanten zu machen:
Mehr Zeit f??r Familie. Mehr Zeit f??r die eine Reise, die schon seit Jahren passieren sollte. Mehr Zeit, um das Leben sorgenfrei auszusch??pfen.
                ''',
      textAlign: TextAlign.start,
      style: context.normalStyle.copyWith(
        color: const Color(0XFFB8B8B8),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      color: const Color(0XFF1A1A1A),
      child: Responsive(
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: image,
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(top: 84),
              child: SizedBox(
                width: 250,
                child: text1,
              ),
            ),
            const SizedBox(width: 38),
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 38),
                child: text2,
              ),
            ),
          ],
        ),
        tablet: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    image,
                    const SizedBox(height: 52),
                    text1,
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(child: text2),
            ],
          ),
        ),
        mobile: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image,
              const SizedBox(height: 20),
              text1,
              const SizedBox(height: 20),
              text2,
            ],
          ),
        ),
      ),
    );
  }
}

class _UberUnsSection extends StatelessWidget {
  const _UberUnsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemScrollController = context.read<ItemScrollController>();
    final itemPositionsListener = context.read<ItemPositionsListener>();

    final buttonHorizontalPadding = Responsive.isDesktop(context) ? 12.0 : 20.0;

    return Container(
      padding: const EdgeInsets.only(top: 63, bottom: 30),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.generalHorizontalPadding),
            child: Text(
              '??ber uns',
              textAlign: TextAlign.center,
              style: context.pageTitleStyle.copyWith(
                color: const Color(0XFFB0D9C0),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.generalHorizontalPadding),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 922),
              child: Text(
                '''
Wir helfen Angestellten, Selbstst??ndigen und Unternehmern dabei, mit Investment- und Steuerstrategien mehr Geld zu sparen, dieses intelligent zu reinvestieren und so fr??hzeitig nachhaltigen Wohlstand aufzubauen - so k??nnen unsere Mandanten ihren gew??nschten Ruhestand mit unserer Hilfe steuern. 
Au??erdem beraten wir unsere Mandanten fortlaufend in strategischen Zielsetzungen, bei der Optimierung interner Prozesse und dem Schaffen neuer Werte.

Wir legen viel Wert auf die Auswahl unserer Kooperationspartner. Dabei achten wir insbesondere auf Integrit??t, kurze Kommunikationsstrecken, professionelle und effiziente Arbeitsprozesse und ein vertrauensvolles Verh??ltnis.
Auch das Thema Data Safety wird bei uns gro?? geschrieben: Wir gehen beim Umgang mit sensiblen Daten mit h??chstem Verantwortungsbewusstsein vor.
                ''',
                textAlign: TextAlign.center,
                style: context.normalStyle,
              ),
            ),
          ),
          const SizedBox(height: 20),
          DestinationButtonWidget(
            horizontalMargin: 0,
            horizontalPadding: buttonHorizontalPadding,
            onTap: () async {
              itemScrollController.jumpTo(
                index: itemPositionsListener.itemPositions.value.first.index,
                alignment: itemPositionsListener.itemPositions.value.first.itemLeadingEdge,
              );
              await itemScrollController.scrollTo(
                index: 11,
                alignment: -0.0001,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOutCubic,
              );
            },
            text: 'Jetzt Strategie Termin vereinbaren',
          ),
        ],
      ),
    );
  }
}

class _KompetenzenSection extends StatefulWidget {
  const _KompetenzenSection({Key? key}) : super(key: key);

  @override
  State<_KompetenzenSection> createState() => _KompetenzenSectionState();
}

class _KompetenzenSectionState extends State<_KompetenzenSection> {
  final visibilityNotifier = ValueNotifier<double>(1);

  @override
  Widget build(BuildContext context) {
    final staggerFactor = Responsive.isDesktop(context) ? 80.0 : 54.0;

    final photoSize = Responsive.isDesktop(context) ? const Size(358, 500) : const Size(240, 335);

    final photoDividerWidth = Responsive.isDesktop(context) ? 20.0 : 13.0;

    final bottomPadding = Responsive.isDesktop(context) ? 154.0 : 100.0;

    final beamerState = context.customPageState;

    // //used in animations
    // const minRangeValue = 3.0;
    // const maxRangeValue = 3.87;

    return VisibilityDetector(
      key: const Key('_KompetenzenSection'),
      onVisibilityChanged: (visibilityInfo) {
        final visibleBounds = visibilityInfo.visibleBounds;

        final normalizedFraction = visibilityInfo.normalizedFraction(context);

        if (!visibleBounds.isEmpty) {
          visibilityNotifier.value = visibleBounds.top > 0 ? 1 : normalizedFraction;
        }
      },
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: context.generalHorizontalPadding,
            right: context.generalHorizontalPadding,
            bottom: bottomPadding,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1114,
            ),
            child: Responsive.isMobile(context)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Kompetenzen',
                        style: context.pageTitleStyle.copyWith(
                          color: const Color(0XFFE6D1E5),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomCard(
                        background: Assets.images.staggeredRowImage1.image(
                          height: photoSize.height,
                          width: photoSize.width,
                          fit: BoxFit.cover,
                        ),
                        onTap: () => beamerState.selectedPage =
                            const PageStateData(page: SitePage.unternehmensberatung),
                        title: 'Unternehmens${Responsive.isDesktop(context) ? '' : '-'}beratung',
                        buttonText: 'Jetzt mehr erfahren',
                      ),
                      const SizedBox(height: 10),
                      CustomCard(
                        background: Assets.images.staggeredRowImage2.image(
                          height: photoSize.height,
                          width: photoSize.width,
                          fit: BoxFit.cover,
                        ),
                        onTap: () => beamerState.selectedPage =
                            const PageStateData(page: SitePage.ruckabwicklung),
                        title: 'R??ckabwicklung',
                        buttonText: 'Jetzt mehr erfahren',
                      ),
                      const SizedBox(height: 10),
                      CustomCard(
                        background: Assets.images.staggeredRowImage3.image(
                          height: photoSize.height,
                          width: photoSize.width,
                          fit: BoxFit.cover,
                        ),
                        onTap: () => beamerState.selectedPage =
                            const PageStateData(page: SitePage.investment),
                        title: 'Investment & Verm??gensschutz',
                        buttonText: 'Jetzt mehr erfahren',
                      ),
                    ],
                  )
                : ValueListenableBuilder<double>(
                    valueListenable: visibilityNotifier,
                    builder: (context, value, _) {
                      final scaledValue = staggerFactor * value;
                      final card1Padding = (2 * staggerFactor) - scaledValue;
                      final card3Padding = scaledValue;

                      return Stack(
                        children: [
                          Opacity(
                            opacity: value,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlexibleConstrainedBox(
                                  maxWidth: photoSize.width,
                                  child: CustomCard(
                                    topPadding: card1Padding,
                                    background: Assets.images.staggeredRowImage1.image(
                                      height: photoSize.height,
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () => beamerState.selectedPage =
                                        const PageStateData(page: SitePage.unternehmensberatung),
                                    title:
                                        'Unternehmens${Responsive.isDesktop(context) ? '' : '-'}beratung',
                                    buttonText: 'Jetzt mehr erfahren',
                                  ),
                                ),
                                SizedBox(width: photoDividerWidth),
                                FlexibleConstrainedBox(
                                  maxWidth: photoSize.width,
                                  child: CustomCard(
                                    topPadding: staggerFactor,
                                    background: Assets.images.staggeredRowImage2.image(
                                      height: photoSize.height,
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () => beamerState.selectedPage =
                                        const PageStateData(page: SitePage.ruckabwicklung),
                                    title: 'R??ckabwicklung',
                                    buttonText: 'Jetzt mehr erfahren',
                                  ),
                                ),
                                SizedBox(width: photoDividerWidth),
                                FlexibleConstrainedBox(
                                  maxWidth: photoSize.width,
                                  child: CustomCard(
                                    topPadding: card3Padding,
                                    background: Assets.images.staggeredRowImage3.image(
                                      height: photoSize.height,
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () => beamerState.selectedPage =
                                        const PageStateData(page: SitePage.investment),
                                    title: 'Investment & Verm??gensschutz',
                                    buttonText: 'Jetzt mehr erfahren',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Text(
                              'Kompetenzen',
                              style: context.pageTitleStyle.copyWith(
                                color: const Color(0XFFE6D1E5),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
          ),
        ),
      ),
    );
  }

  double getNormalizedValue(ItemPosition position, double minRangeValue, double maxRangeValue) {
    late double normalizedValue;

    var positionValue = position.index - position.itemLeadingEdge;

    if (positionValue >= 1 && positionValue <= 2) {
      //to perform the animation on fade scroll.
      normalizedValue = positionValue - 1;
    } else {
      //to perform the animation attending to the visibility fraction of the page.
      if (positionValue < minRangeValue) {
        positionValue = minRangeValue;
      } else if (positionValue > maxRangeValue) {
        positionValue = maxRangeValue;
      }

      normalizedValue = (positionValue - minRangeValue) / (maxRangeValue - minRangeValue);
    }
    return normalizedValue;
  }
}

class _SectionContent3 extends StatefulWidget {
  const _SectionContent3({
    Key? key,
  }) : super(key: key);

  @override
  State<_SectionContent3> createState() => _SectionContent3State();
}

class _SectionContent3State extends State<_SectionContent3> {
  late final ValueNotifier<double> visibilityNotifier = ValueNotifier(1)
    ..addListener(() {
      if (visibilityNotifier.value == 1) {
        startFirstTextAnimation.value = true;
      }
    });
  final ValueNotifier<bool> startSecondTextAnimation = ValueNotifier(false);
  final ValueNotifier<bool> startFirstTextAnimation = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final sectionHeight = Responsive.isDesktop(context)
        ? 582.0
        : Responsive.isTablet(context)
            ? 337.0
            : 403.0;
    final horizontalPadding = Responsive.isDesktop(context)
        ? 100.0
        : Responsive.isTablet(context)
            ? 50.0
            : 23.0;

    final textAlign = Responsive.isMobile(context) ? TextAlign.end : TextAlign.center;
    final subtitleFontSize = Responsive.isDesktop(context) ? 32.0 : 20.0;

    return Container(
      height: sectionHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.homeImage2.image().image,
          fit: BoxFit.cover,
          scale: 1.3,
        ),
      ),
      child: VisibilityDetector(
        key: const Key('_SectionContent3'),
        onVisibilityChanged: (visibilityInfo) {
          final visibleBounds = visibilityInfo.visibleBounds;
          final normalizedFraction = visibilityInfo.normalizedFraction(context);
          if (!visibleBounds.isEmpty) {
            visibilityNotifier.value = normalizedFraction;
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isMobile(context)) const Expanded(child: SizedBox.shrink()),
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                    animation: Listenable.merge([
                      startFirstTextAnimation,
                      startSecondTextAnimation,
                    ]),
                    builder: (context, _) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 847),
                            child: CustomSlideAndFadeAnimatedText(
                              'Das Leben von morgen schon heute gestalten.',
                              style: context.mainStyle1.copyWith(fontWeight: FontWeight.w300),
                              textAlign: textAlign,
                              maxLine: 3,
                              startAnimation: startFirstTextAnimation.value,
                              onEnd: () => startSecondTextAnimation.value = true,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 29),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 65),
                                child: CustomSlideAndFadeAnimatedText(
                                  '- mit SYKZ',
                                  style: TextStyle(
                                    fontWeight: R.fontWidths.regular,
                                    fontSize: subtitleFontSize,
                                    color: Colors.white,
                                  ),
                                  startAnimation: startSecondTextAnimation.value,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionContent2 extends StatefulWidget {
  const _SectionContent2({
    Key? key,
  }) : super(key: key);

  @override
  State<_SectionContent2> createState() => _SectionContent2State();
}

class _SectionContent2State extends State<_SectionContent2> {
  final visibilityNotifier = ValueNotifier<double>(1);

  @override
  Widget build(BuildContext context) {
    final verticalPadding = Responsive.isDesktop(context)
        ? 100.0
        : Responsive.isTablet(context)
            ? 80.0
            : 50.0;

    final photoSize = Responsive.isDesktop(context)
        ? const Size(240, 260)
        : Responsive.isTablet(context)
            ? const Size(204, 228)
            : const Size(210, 228);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: Color.alphaBlend(
          R.colors.maskColor1.withOpacity(0.5),
          Colors.white,
        ),
      ),
      child: VisibilityDetector(
        key: const Key('_SectionContent2'),
        onVisibilityChanged: (visibilityInfo) {
          final visibleBounds = visibilityInfo.visibleBounds;

          final normalizedFraction = visibilityInfo.normalizedFraction(context);

          if (!visibleBounds.isEmpty) {
            visibilityNotifier.value = visibleBounds.top > 0 ? 1 : normalizedFraction;
          }
        },
        child: ValueListenableBuilder(
            valueListenable: visibilityNotifier,
            builder: (context, animationValue, _) {
              final maxTranslateValue = Responsive.isMobile(context) ? 80 : 150;

              final translateProgress = maxTranslateValue - (maxTranslateValue * animationValue);
              return Opacity(
                opacity: animationValue,
                child: Transform.translate(
                  offset: Offset.fromDirection(1.5, translateProgress),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.generalHorizontalPadding),
                        child: Text(
                          'Wie viel Zeit ist genug Zeit?',
                          textAlign: TextAlign.center,
                          style: context.pageTitleStyle.copyWith(color: R.colors.backgroundColor),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.generalHorizontalPadding),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 922),
                          child: Text(
                            '''
Mit dieser Frage besch??ftigen wir uns nun schon lange - und sie hat uns bisher nicht losgelassen.
Der Wunsch, unseren Mandanten mehr pers??nliche, berufliche und finanzielle Freiheit zu erm??glichen, ist das was uns antreibt. Mit unserer individuellen Betreuung entwickeln wir ganzheitliche Strategien, die zu unseren Mandanten passen. Dabei legen wir vor allem Wert auf den kontinuierlichen, pers??nlichen Austausch. 
Indem wir eng mit unseren Mandanten zusammenarbeiten, finden wir heraus, was sie wirklich bewegt. Dabei haben wir eine zentrale Sache herausgefunden: 
Wir haben einen angestellten Maschinenbauingenieur, einen Apotheker und einen Konzerninhaber gefragt, was Ihnen in der Zusammenarbeit mit uns wichtig ist und welche Strategie wir gemeinsam verfolgen wollen. Alle gaben uns intuitiv dieselbe Antwort.
???Zeit - wir wollen mehr Zeit haben.???
Danach haben wir mit unserem Expertenteam die einzigartige hourglass investment strategy entwickelt, die uns und unseren Mandanten noch besser und effektiver dabei hilft, ihre Motive und Bed??rfnisse zu verstehen.                        
                          ''',
                            textAlign: TextAlign.center,
                            style: context.normalStyle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      if (Responsive.isMobile(context))
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 5),
                              Assets.images.rowImage1.image(
                                height: photoSize.height,
                                width: photoSize.width,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 5),
                              Assets.images.rowImage2.image(
                                height: photoSize.height,
                                width: photoSize.width,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 5),
                              Assets.images.rowImage3.image(
                                height: photoSize.height,
                                width: photoSize.width,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        )
                      else
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: context.generalHorizontalPadding),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 955,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlexibleConstrainedBox(
                                  maxWidth: photoSize.width,
                                  child: Assets.images.rowImage1.image(
                                    height: photoSize.height,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                FlexibleConstrainedBox(
                                  maxWidth: photoSize.width,
                                  child: Assets.images.rowImage2.image(
                                    height: photoSize.height,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                FlexibleConstrainedBox(
                                  maxWidth: photoSize.width,
                                  child: Assets.images.rowImage3.image(
                                    height: photoSize.height,
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
              );
            }),
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
    this.topPadding = 0,
    required this.onTap,
  });

  final Widget background;
  final String title;
  final String buttonText;
  final double topPadding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final buttonFontSize = Responsive.isDesktop(context) ? 15.0 : 11.0;

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
                  left: 0,
                  top: 48,
                  right: 8,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: constraint.maxWidth,
                    child: TrapezeContainer(
                      fillColor: Color.alphaBlend(Colors.black45, const Color(0xFFD8ECDF)),
                      child: Text(
                        title,
                        style: context.homeCardTitleStyle,
                      ),
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
                      fontSize: buttonFontSize,
                      onTap: onTap,
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

class TeamMemberCard extends StatelessWidget {
  const TeamMemberCard({
    super.key,
    required this.memberPhoto,
    required this.name,
    required this.roll,
    required this.phone,
    required this.email,
  });

  final Widget memberPhoto;
  final String name;
  final String roll;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        memberPhoto,
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            alignment: Alignment.topCenter,
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(
              horizontal: 31,
              vertical: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: R.fontWidths.regular,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                const SizedBox(height: 10),
                Text(
                  roll,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: R.fontWidths.regular,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: phone)).then(
                      (_) => showCopiedMessage(context),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Telefon $phone',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: R.fontWidths.regular,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: email)).then(
                      (_) => showCopiedMessage(context),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'E-Mail $email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: R.fontWidths.regular,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showCopiedMessage(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(100),
                color: Colors.black87,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Copied',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
        ),
      );
  }
}

enum MainContentAnimationState { pending, done }

class _SectionContent1 extends StatefulWidget {
  const _SectionContent1({
    super.key,
  });

  @override
  State<_SectionContent1> createState() => _SectionContent1State();
}

class _SectionContent1State extends State<_SectionContent1> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => animationStateNotifier.value = MainContentAnimationState.done,
    );
  }

  late final animationStateNotifier = Provider.of<ValueNotifier<MainContentAnimationState>>(
    context,
    listen: false,
  );

  static const animationDuration = Duration(milliseconds: 800);

  static const _translationValue = 150.0;

  @override
  Widget build(BuildContext context) {
    final appIconSize =
        Responsive.isDesktop(context) ? const Size(210, 68.74) : const Size(155, 51);

    final axisDirection = Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal;

    final separatorSize = Responsive.isDesktop(context) ? 14.0 : 10.0;

    final buttonHorizontalPadding = Responsive.isDesktop(context) ? 12.0 : 20.0;

    final isAnimationPending = animationStateNotifier.value == MainContentAnimationState.pending;

    final itemScrollController = context.read<ItemScrollController>();
    final itemPositionsListener = context.read<ItemPositionsListener>();

    return Center(
      child: SizedBox(
        height: Responsive.isDesktop(context)
            ? 139
            : Responsive.isTablet(context)
                ? 85
                : null,
        width: Responsive.isMobile(context) ? 156 : null,
        child: AnimationConfiguration.synchronized(
          child: ConditionalParentWidget(
            condition: isAnimationPending,
            conditionalBuilder: (child) => FadeInAnimation(
              duration: animationDuration,
              curve: Curves.decelerate,
              child: child,
            ),
            child: Flex(
              direction: axisDirection,
              mainAxisSize: MainAxisSize.min,
              children: [
                ConditionalParentWidget(
                  condition: isAnimationPending,
                  conditionalBuilder: (child) => SlideAnimation(
                    duration: animationDuration,
                    curve: Curves.decelerate,
                    horizontalOffset: -_translationValue,
                    child: child,
                  ),
                  child: Assets.icons.sykzIcon.svg(
                    height: appIconSize.height,
                    width: appIconSize.width,
                  ),
                ),
                Responsive(
                  desktop: VerticalDivider(
                    color: R.colors.iconsColor,
                    width: 46,
                  ),
                  tablet: VerticalDivider(
                    color: R.colors.iconsColor,
                    width: 46,
                  ),
                  mobile: Divider(
                    color: R.colors.iconsColor,
                    height: 46,
                  ),
                ),
                ConditionalParentWidget(
                  condition: isAnimationPending,
                  conditionalBuilder: (child) => SlideAnimation(
                    duration: animationDuration,
                    curve: Curves.decelerate,
                    horizontalOffset: _translationValue,
                    child: child,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DestinationButtonWidget(
                        horizontalMargin: 0,
                        horizontalPadding: buttonHorizontalPadding,
                        onTap: () async {
                          itemScrollController.jumpTo(
                            index: itemPositionsListener.itemPositions.value.first.index,
                            alignment:
                                itemPositionsListener.itemPositions.value.first.itemLeadingEdge,
                          );
                          await itemScrollController.scrollTo(
                            index: 11,
                            alignment: -0.0001,
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                        text: 'Strategie Termin',
                      ),
                      SizedBox(
                        height: separatorSize,
                      ),
                      const SocialMediaList(),
                      SizedBox(
                        height: separatorSize,
                      ),
                      Text(
                        'DESIRE. CREATE. INSPIRE.',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Responsive.isDesktop(context) ? 10 : 8,
                          color: R.colors.sloganColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
