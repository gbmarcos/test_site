import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/utils/text_util.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/common/widgets/custom_scrollable_positioned_list.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';
import 'package:test_site/screens/home/home_screen.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisionScreen extends StatefulWidget {
  const VisionScreen({Key? key}) : super(key: key);

  @override
  State<VisionScreen> createState() => _VisionScreenState();
}

class _VisionScreenState extends State<VisionScreen> {
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
              image: Assets.images.investmentImage1.image().image,
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
      title: 'Leanmanagement.',
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

    return Container(
      padding: padding,
      color: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1114,
        ),
        child: MixedCollage(
          image1: Assets.images.mixedCollage5.image().image,
          image2: Assets.images.mixedCollage2.image().image,
          text1Builder: (style, textAlign) => Text(
            'Wir bei SYKZ Consulting haben es uns zur '
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
            style: style,
            textAlign: textAlign,
          ),
          text2Builder: (style, textAlign) => DefaultTextStyle(
            style: style,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Zu unseren Dienstleistungen im Bereich Vermögensschutz und Investment gehören:\n',
                  ),
                  bulledText('Sach-, Gewerbe-, und Personenversicherungen'),
                  bulledText('Honorarberatung nach §34h für Finanzanlagen'),
                  bulledText('Edelmetallsparpläne und Einmalinvestitionen (physisch)'),
                  bulledText('Rohstoffe und Industriemetalle'),
                  bulledText('Rekreatives medizinisches Cannabis (physisch)'),
                  bulledText('Venture Capital ab nur 1.000 € Investition'),
                  bulledText('Off Market Investment & Private Sales'),
                  bulledText('Devisenhandel'),
                  bulledText('Photovoltaik für Privatpersonen und Unternehmen unter '
                      'Berücksichtigung des IAB (Eigennutzung & Steueroptimierung)'),
                  bulledText('Internationale Off-Market Immobilien'),
                  bulledText('Finanzierungen (Immobilien, Privatkredite, Kapitalbeschaffung)'),
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
          text: 'Vermögensschutz & Investment.',
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
