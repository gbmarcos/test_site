import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/utils/text_util.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/common/widgets/custom_scrollable_positioned_list.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';
import 'package:test_site/screens/screens.dart';
import 'package:visibility_detector/visibility_detector.dart';

class UberUnsScreen extends StatefulWidget {
  const UberUnsScreen({Key? key}) : super(key: key);

  @override
  State<UberUnsScreen> createState() => _UberUnsScreenState();
}

class _UberUnsScreenState extends State<UberUnsScreen> {
  late final sections = [
    LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: context.mediaQuery.size.height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.srcOver,
              ),
              image: Assets.images.unternehmensberatungImage1.image().image,
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
      );
    }),
    const _SectionContent2(),
    const AppForm2(),
    SectionWithImageCollage(
      title: 'Unternehmens${Responsive.isDesktop(context) ? '' : '-'}beratung.',
      subtitle: 'Anwendungsbeispiele',
    ),
    const _SectionContent4(),
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

    final boldWeight = Responsive.isDesktop(context) ? R.fontWidths.bold : R.fontWidths.semiBold;

    return Container(
      padding: padding,
      color: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1114,
        ),
        child: MixedCollage(
          image1: Assets.images.mixedCollage1.image().image,
          image2: Assets.images.mixedCollage2.image().image,
          text1Builder: (style, textAlign) => Text(
            'Wir optimieren nicht nur Ihre internen und externen '
            'Arbeitsprozesse und analysieren Ihre Unternehmensstruktur '
            'und -kultur, sondern betrachten die Analyse Ihres Unternehmens ganzheitlich.'
            'Im Versicherungsbereich sind wir zudem eines der ersten Unternehmen '
            'deutschlandweit, das nach der Gewerbe DIN Norm 77235 arbeitet, '
            'die am 01.07. dieses Jahres erschienen ist. '
            'Neben den finanziellen und internen Optimierungsmöglichkeiten '
            'unterstützen wir unsere Mandanten zusätzlich auch in steuerlichen '
            'Fragen. Dort arbeiten wir mit einer renommierten und innovativen '
            'Wirtschaftsprüfergesellschaft zusammen, um stets die optimale Lösung '
            'für Ihren individuellen Fall zu finden.',
            style: style,
            textAlign: textAlign,
          ),
          text2Builder: (style, textAlign) => DefaultTextStyle(
            style: style,
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Lösungen:\n'),
                  TextSpan(
                    text: 'Kernbereich 1: Organisationsentwicklung & '
                        'Aufbau/Entwicklung integrierter Managementsysteme\n',
                    style: style.copyWith(fontWeight: boldWeight),
                  ),
                  TextSpan(
                    children: [
                      bulledText('interne Prozess-/Managementsystemauditierung',style: style),
                      bulledText('Optimierung von Aufbau- und Ablauforganisation'),
                      bulledText('Schulung und Beratung in den Bereichen QM, AS, DS'),
                      bulledText('Mitarbeiterentwicklungs-/ und -bindungskonzepte'),
                      bulledText('Grundlagen Datenschutz'),
                    ],
                  ),
                  TextSpan(
                    text: 'Kernbereich 2: Steuergestaltung & Optimierung (KMU)\n',
                    style: style.copyWith(
                      fontWeight: boldWeight,
                    ),
                  ),
                  TextSpan(
                    children: [
                      bulledText('Prüfung & Optimierung der Gesellschaftsform(en)'),
                      bulledText('Gründung von neuen Rechtsformen ( besondere Expertise '
                          'bei Genossenschaften und Stiftungen)'),
                      bulledText('Erbschaftsplanung uvm.'),
                    ],
                  ),
                  TextSpan(
                    text: 'Kernbereich 3: Finanzplanung\n',
                    style: style.copyWith(fontWeight: boldWeight),
                  ),
                  TextSpan(
                    children: [
                      bulledText('Nettolohnkostenoptimierung'),
                      bulledText('betriebliche Altersvorsorge (bAV)'),
                      bulledText('Finanzmathematische Risikoanalyse (DIN 77235)'),
                      bulledText(
                          'Start-Up Entwicklung, Förderung und Beschaffung von Venture Capital'),
                    ],
                  ),
                ],
              ),
              style: style,
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionContent1 extends StatefulWidget {
  const _SectionContent1({Key? key}) : super(key: key);

  @override
  State<_SectionContent1> createState() => _SectionContent1State();
}

class _SectionContent1State extends State<_SectionContent1> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => animationStateNotifier?.value = MainContentAnimationState.done,
    );
  }

  late final animationStateNotifier = Provider.of<ValueNotifier<MainContentAnimationState>?>(
    context,
    listen: false,
  );

  @override
  Widget build(BuildContext context) {
    final isAnimationPending = (animationStateNotifier == null) ||
        (animationStateNotifier?.value == MainContentAnimationState.pending);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: MainTextAnimation(
          isAnimationPending: isAnimationPending,
          text: 'Unternehmens${Responsive.isDesktop(context) ? '' : '-'}beratung.',
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
