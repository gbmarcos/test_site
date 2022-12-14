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

class KompetenzenScreen extends StatefulWidget {
  const KompetenzenScreen({Key? key}) : super(key: key);

  @override
  State<KompetenzenScreen> createState() => _KompetenzenScreenState();
}

class _KompetenzenScreenState extends State<KompetenzenScreen> {
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
              image: Assets.images.ruckabwicklungImage1.image().image,
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
    const SectionWithImageCollage(
      title: 'Prozessoptimierung.',
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
          text: 'R??ckabwicklung',
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
          text1Builder: (style, textAlign) => DefaultTextStyle(
            style: style,
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: '''
Unseren zweiten Kernbereich stellt das Thema R??ckabwicklung dar.
Sie haben einen alten, noch laufenden Vertrag aus den folgenden Kategorien und fragen sich, ob dieser ??berhaupt noch zeitgem????, geschweige denn verbraucherschutzkonform ist?
'''),
                  bulledText('Lebens- und Rentenversicherungen'),
                  bulledText('Bausparvertr??ge'),
                  bulledText('Riester-Vertr??ge'),
                  bulledText('Unfallversicherungen mit Beitragsr??ckgew??hr'),
                  bulledText('staatlich gef??rderte Zukunftsvorsorgen'),
                  bulledText('betriebliche Altersvorsorgen'),
                  bulledText(
                      '??ber das zur Unternehmensgruppe geh??rende Unternehmen LIQIDA helfen wir Ihnen, Ihre Vertr??ge zu pr??fen.'),
                ],
              ),
              style: style,
              textAlign: textAlign,
            ),
          ),
          text2Builder: (style, textAlign) => Text(
            '''
Welche Vorteile hat diese Dienstleistung konkret f??r Sie?
Statt einer K??ndigung l??sen wir den Vertrag f??r Sie auf, wenn die Pr??fung ergibt, dass der geschlossene Vertrag fehlerhaft oder sogar rechtswidrig ist. Dadurch vermeiden Sie Strafgeb??hren und eine unn??tig hohe Steuerlast, die bei einer klassischen K??ndigung entstehen w??rde.
Bei vollst??ndigem Einreichen der ben??tigten Unterlagen bekommen Sie bereits binnen 18 Tagen das eingelegte Geld aus Ihrem Vertrag ausgezahlt (Option 1).
Wir empfehlen hier jedoch, mit einer unserer Anlagestrategien den R??ckkaufswert direkt beim Einreichen der Unterlagen zu reinvestieren, sodass Ihr Verm??gen fortan wirklich f??r Sie arbeiten kann (Option 2).
Nach der R??ckabwicklung wird ??ber einen Zeitraum von sechs bis 24 Monaten der Vertrag und dessen AGB erneut durch Rechtsanw??lte gepr??ft. 50% unserer Kunden werden nach dieser Pr??fung im Durchschnitt noch einmal zus??tzlich zwischen 10 und 20 % Ihres R??ckkaufswertes ausgesch??ttet.
Wie das funktioniert, erkl??ren wir Ihnen gerne in einer pers??nlichen Beratung mit uns.
          ''',
            style: style,
            textAlign: textAlign,
          ),
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
