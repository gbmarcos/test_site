import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

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
                const Color(0xFF7D7A7A).withOpacity(0.7),
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
    const CustomFooter(),
  ];

  ValueNotifier<ItemPosition> positionNotifier = ValueNotifier(ItemPosition(
    index: 4,
    itemLeadingEdge: 0,
    itemTrailingEdge: 1,
  ));

  late final ItemScrollController itemScrollController = ItemScrollController();
  late final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create()
    ..itemPositions.addListener(() {
      positionNotifier.value = itemPositionsListener.itemPositions.value.first;
    });

  @override
  Widget build(BuildContext context) {
    final beamerState = context.customPageState;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ValueNotifier(false),
        ),
        ChangeNotifierProvider.value(
          value: positionNotifier,
        ),
      ],
      child: Scaffold(
        body: ScrollablePositionedList.builder(
          initialScrollIndex: beamerState.selectedPage.section,
          padding: EdgeInsets.zero,
          itemCount: sections.length,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemBuilder: (context, index) => sections[index],
        ),
      ),
    );

    // return ChangeNotifierProvider(
    //   create: (_) => ValueNotifier(false),
    //   child: Scaffold(
    //     body: ScrollablePositionedList.builder(
    //       initialScrollIndex: beamerState.selectedPage.section,
    //       padding: EdgeInsets.zero,
    //       itemCount: sections.length,
    //       itemScrollController: itemScrollController,
    //       itemPositionsListener: itemPositionsListener,
    //       itemBuilder: (context, index) => sections[index],
    //     ),
    //   ),
    // );
  }
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlexibleConstrainedBox(
                    maxWidth: photoSize.width,
                    child: TeamMemberCard(
                      memberPhoto: Assets.images.member1.image(
                        height: photoSize.height,
                        fit: BoxFit.cover,
                      ),
                      info: 'Lorem ipsum dolor sit amet, '
                          'consectetur adipiscing elit. '
                          'Vulputate varius dolor, ac cras ultricies '
                          'viverra etiam augue viverra. '
                          'Consectetur ornare curabitur leo a '
                          'lacus turpis id sit vestibulum.',
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
                      info: 'Lorem ipsum dolor sit amet, '
                          'consectetur adipiscing elit. '
                          'Vulputate varius dolor, ac cras ultricies '
                          'viverra etiam augue viverra. '
                          'Consectetur ornare curabitur leo a '
                          'lacus turpis id sit vestibulum.',
                    ),
                  ),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                    maxWidth: photoSize.width,
                    child: TeamMemberCard(
                      memberPhoto: Assets.images.member3.image(
                        height: photoSize.height,
                        fit: BoxFit.cover,
                      ),
                      info: 'Lorem ipsum dolor sit amet, '
                          'consectetur adipiscing elit. '
                          'Vulputate varius dolor, ac cras ultricies '
                          'viverra etiam augue viverra. '
                          'Consectetur ornare curabitur leo a '
                          'lacus turpis id sit vestibulum.',
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
                info: 'Lorem ipsum dolor sit amet, '
                    'consectetur adipiscing elit. '
                    'Vulputate varius dolor, ac cras ultricies '
                    'viverra etiam augue viverra. '
                    'Consectetur ornare curabitur leo a '
                    'lacus turpis id sit vestibulum.',
              ),
              const SizedBox(height: 10),
              TeamMemberCard(
                memberPhoto: Assets.images.member2.image(
                  height: photoSize.height,
                  width: photoSize.width,
                  fit: BoxFit.cover,
                ),
                info: 'Lorem ipsum dolor sit amet, '
                    'consectetur adipiscing elit. '
                    'Vulputate varius dolor, ac cras ultricies '
                    'viverra etiam augue viverra. '
                    'Consectetur ornare curabitur leo a '
                    'lacus turpis id sit vestibulum.',
              ),
              const SizedBox(height: 10),
              TeamMemberCard(
                memberPhoto: Assets.images.member3.image(
                  height: photoSize.height,
                  width: photoSize.width,
                  fit: BoxFit.cover,
                ),
                info: 'Lorem ipsum dolor sit amet, '
                    'consectetur adipiscing elit. '
                    'Vulputate varius dolor, ac cras ultricies '
                    'viverra etiam augue viverra. '
                    'Consectetur ornare curabitur leo a '
                    'lacus turpis id sit vestibulum.',
              ),
            ],
          ),
      ]),
    );
  }
}

class _VisionSection extends StatelessWidget {
  const _VisionSection({Key? key}) : super(key: key);

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
        Text(
          '''
Perspektive. Unser Anspruch an uns selbst und an unsere Dienstleistungen sollte schon immer in der Ganzheitlichkeit liegen.
Um die Bedürfnisse der Mandanten zu ermitteln, gehört für uns daher ein umfangreiches Kennenlernen dazu. Wir möchten nicht nur der Partner für Ihre Finanzen und Ihre Unternehmensberatung sein - wir möchten jeden Mandanten auf persönlicher Ebene verstehen lernen, um so seine Individualität zu würdigen. Dies schätzen unsere Mandanten sehr.
Unser Fokus liegt auf Exklusivität. 
Bei  SYKZ arbeiten wir mit Menschen zusammen, nicht mit Zahlen. Daher schauen auch wir bei jedem Erstgespräch, ob Sie zu uns passen.
                      ''',
          style: context.normalStyle,
          textAlign: Responsive.isMobile(context) ? TextAlign.left : TextAlign.right,
        ),
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
        Text(
          '''
Innovation.Hochkomplexe Themen in Nischenmärkten jedem zugänglich zu machen, der es wertschätzen kann - das ist unsere Passion. Wir machen keine klassische Finanz- und Unternehmensberatung. Wir schaffen wirkliche Werte. 
Wie wir das tun? Weil wir hinter die Fassade schauen. Indem wir die richtigen Fragen stellen, finden wir für Sie die richtigen Antworten.
                        ''',
          style: context.normalStyle,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: vision,
                  ),
                  const SizedBox(width: 100),
                  Expanded(
                    child: mission,
                  ),
                ],
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
                  ),
                ),
                const SizedBox(height: 32),
                Assets.icons.sykzIcon2.svg(height: appIconSize.height, width: appIconSize.width),
                const SizedBox(height: 60),
                const AppForm1(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _SectionContent7 extends StatelessWidget {
  const _SectionContent7({
    Key? key,
  }) : super(key: key);

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

    return Container(
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
            child: const PhotoCollageWidget(),
          )
        ],
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
Unser Team, das sich durch jahrelange Erfahrung auszeichnet, sorgt durch strategische Unternehmensanalysen nicht nur für maximale Sicherheit und Transparenz in der Auswahl unserer Partner - uns ist es ebenso wichtig, eine Unternehmenskultur auf Augenhöhe zu leben. Daher kennen wir die Inhaber unserer Partnerunternehmen stets persönlich.
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
                  Container(
                    height: 73,
                    color: boxColor,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 73,
                    color: boxColor,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 73,
                    color: boxColor,
                  ),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlexibleConstrainedBox(
                      maxWidth: boxSize.width,
                      child: Container(
                        height: boxSize.height,
                        color: boxColor,
                      )),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                      maxWidth: boxSize.width,
                      child: Container(
                        height: boxSize.height,
                        color: boxColor,
                      )),
                  const SizedBox(width: 20),
                  FlexibleConstrainedBox(
                    maxWidth: boxSize.width,
                    child: Container(
                      height: boxSize.height,
                      color: boxColor,
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
Mit der SYKZ hourglass strategy verfolgen wir eine ganzheitlich neue Herangehensweise in der Finanzberatung. Uns ist aufgefallen, dass bei der Analyse unserer Mandanten ein Thema immer wieder in den Fokus rückt. Bei der Frage, was unseren Mandanten in der Beratung am wichtigsten ist, kommt fast immer die selbe Antwort: Zeit. Deswegen haben wir es uns zur Aufgabe gemacht, diese knappe und unwiederbringliche Ressource zu unserem Hauptaugenmerk in der Betreuung unserer Mandanten zu machen:
Mehr Zeit für Familie. Mehr Zeit für die eine Reise, die schon seit Jahren passieren sollte. Mehr Zeit, um das Leben sorgenfrei auszuschöpfen.
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
    return Container(
      padding: const EdgeInsets.only(top: 63, bottom: 30),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.generalHorizontalPadding),
            child: Text(
              'Über uns',
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
Wir helfen Angestellten, Selbstständigen und Unternehmern dabei, mit Investment- und Steuerstrategien mehr Geld zu sparen, dieses intelligent zu reinvestieren und so frühzeitig nachhaltigen Wohlstand aufzubauen - so können unsere Mandanten ihren gewünschten Ruhestand mit unserer Hilfe steuern. 
Außerdem beraten wir unsere Mandanten fortlaufend in strategischen Zielsetzungen, bei der Optimierung interner Prozesse und dem Schaffen neuer Werte.

Wir legen viel Wert auf die Auswahl unserer Kooperationspartner. Dabei achten wir insbesondere auf Integrität, kurze Kommunikationsstrecken, professionelle und effiziente Arbeitsprozesse und ein vertrauensvolles Verhältnis.
Auch das Thema Data Safety wird bei uns groß geschrieben: Wir gehen beim Umgang mit sensiblen Daten mit höchstem Verantwortungsbewusstsein vor.
Jetzt Strategie Termin vereinbaren.
                ''',
                textAlign: TextAlign.center,
                style: context.normalStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KompetenzenSection extends StatelessWidget {
  const _KompetenzenSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final staggerFactor = Responsive.isDesktop(context) ? 80.0 : 54.0;

    final photoSize = Responsive.isDesktop(context) ? const Size(358, 500) : const Size(240, 335);

    final photoDividerWidth = Responsive.isDesktop(context) ? 20.0 : 13.0;

    final bottomPadding = Responsive.isDesktop(context) ? 154.0 : 100.0;

    final beamerState = context.customPageState;

    final valueListenable = Provider.of<ValueNotifier<ItemPosition>>(context, listen: true);

    //used in animations
    const minRangeValue = 3.0;
    const maxRangeValue = 3.87;

    return ColoredBox(
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
                      title: 'Unternehmensberatung',
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
                      title: 'Rückabwicklung',
                      buttonText: 'Jetzt mehr erfahren',
                    ),
                    const SizedBox(height: 10),
                    CustomCard(
                      background: Assets.images.staggeredRowImage1.image(
                        height: photoSize.height,
                        width: photoSize.width,
                        fit: BoxFit.cover,
                      ),
                      onTap: () =>
                          beamerState.selectedPage = const PageStateData(page: SitePage.investment),
                      title: 'Investment & Vermögensschutz',
                      buttonText: 'Jetzt mehr erfahren',
                    ),
                  ],
                )
              : ValueListenableBuilder<ItemPosition>(
                  valueListenable: valueListenable,
                  builder: (context, position, _) {
                    final normalizedValue = getNormalizedValue(
                      position,
                      minRangeValue,
                      maxRangeValue,
                    );

                    final scaledValue = staggerFactor * normalizedValue;

                    final card1Padding = (2 * staggerFactor) - scaledValue;
                    final card3Padding = scaledValue;

                    return Stack(
                      children: [
                        Opacity(
                          opacity: normalizedValue,
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
                                  title: 'Unternehmensberatung',
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
                                  title: 'Rückabwicklung',
                                  buttonText: 'Jetzt mehr erfahren',
                                ),
                              ),
                              SizedBox(width: photoDividerWidth),
                              FlexibleConstrainedBox(
                                maxWidth: photoSize.width,
                                child: CustomCard(
                                  topPadding: card3Padding,
                                  background: Assets.images.staggeredRowImage1.image(
                                    height: photoSize.height,
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () => beamerState.selectedPage =
                                      const PageStateData(page: SitePage.investment),
                                  title: 'Investment & Vermögensschutz',
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

class _SectionContent3 extends StatelessWidget {
  const _SectionContent3({
    Key? key,
  }) : super(key: key);

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Responsive.isMobile(context)) const Expanded(child: SizedBox.shrink()),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 847),
                    child: Text(
                      'Das Leben von morgen schon heute gestalten.',
                      style: context.mainStyle1.copyWith(fontWeight: FontWeight.w300),
                      textAlign: textAlign,
                    ),
                  ),
                  const SizedBox(height: 29),
                  Padding(
                    padding: const EdgeInsets.only(right: 65),
                    child: Text(
                      '- mit SYKZ',
                      style: TextStyle(
                        fontWeight: R.fontWidths.regular,
                        fontSize: subtitleFontSize,
                        color: Colors.white,
                      ),
                    ),
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

class _SectionContent2 extends StatelessWidget {
  const _SectionContent2({
    Key? key,
  }) : super(key: key);

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
Mit dieser Frage beschäftigen wir uns nun schon lange - und sie hat uns bisher nicht losgelassen.
Der Wunsch, unseren Mandanten mehr persönliche, berufliche und finanzielle Freiheit zu ermöglichen, ist das was uns antreibt. Mit unserer individuellen Betreuung entwickeln wir ganzheitliche Strategien, die zu unseren Mandanten passen. Dabei legen wir vor allem Wert auf den kontinuierlichen, persönlichen Austausch. 
Indem wir eng mit unseren Mandanten zusammenarbeiten, finden wir heraus, was sie wirklich bewegt. Dabei haben wir eine zentrale Sache herausgefunden: 
Wir haben einen angestellten Maschinenbauingenieur, einen Apotheker und einen Konzerninhaber gefragt, was Ihnen in der Zusammenarbeit mit uns wichtig ist und welche Strategie wir gemeinsam verfolgen wollen. Alle gaben uns intuitiv dieselbe Antwort.
„Zeit - wir wollen mehr Zeit haben.“
Danach haben wir mit unserem Expertenteam die einzigartige hourglass investment strategy entwickelt, die uns und unseren Mandanten noch besser und effektiver dabei hilft, ihre Motive und Bedürfnisse zu verstehen.                        
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
              padding: EdgeInsets.symmetric(horizontal: context.generalHorizontalPadding),
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
                  left: 18,
                  top: 21,
                  right: 18,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: constraint.maxWidth,
                    child: Text(
                      title,
                      style: context.homeCardTitleStyle,
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
    required this.info,
  });

  final Widget memberPhoto;
  final String info;

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
            alignment: Alignment.topLeft,
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(
              horizontal: 31,
              vertical: 25,
            ),
            child: Text(
              info,
              textAlign: TextAlign.center,
              style: context.normalStyle.copyWith(
                color: Colors.white,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionContent1 extends StatefulWidget {
  const _SectionContent1({Key? key}) : super(key: key);

  @override
  State<_SectionContent1> createState() => _SectionContent1State();
}

class _SectionContent1State extends State<_SectionContent1> {
  GlobalKey aniKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appIconSize =
        Responsive.isDesktop(context) ? const Size(210, 68.74) : const Size(155, 51);

    final axisDirection = Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal;

    final separatorSize = Responsive.isDesktop(context) ? 14.0 : 10.0;

    final buttonHorizontalPadding = Responsive.isDesktop(context) ? 12.0 : 20.0;

    final initializedNotifier = Provider.of<ValueNotifier<bool>>(context);

    return Center(
      child: SizedBox(
        height: Responsive.isDesktop(context)
            ? 139
            : Responsive.isTablet(context)
                ? 85
                : null,
        width: Responsive.isMobile(context) ? 156 : null,
        child: PlayAnimationBuilder<double>(
          curve: Curves.decelerate,
          tween: Tween(begin: initializedNotifier.value ? 1 : 0, end: 1),
          // 100.0 to 200.0
          duration: const Duration(milliseconds: 800),
          onCompleted: () {
            initializedNotifier.value = true;
          },
          builder: (context, value, _) {
            const translationFactor = 150;
            final translationValue = translationFactor - (value * translationFactor);

            return Opacity(
              opacity: value,
              child: Flex(
                direction: axisDirection,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(-translationValue, 0),
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
                  Transform.translate(
                    offset: Offset(translationValue, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DestinationButtonWidget(
                          horizontalMargin: 0,
                          horizontalPadding: buttonHorizontalPadding,
                          onTap: () {},
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
            );
          },
        ),
      ),
    );
  }
}
