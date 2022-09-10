import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/common/widgets/navbar.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = context.mediaQuery;
    return AnimationManager(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: mediaQuery.size.height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Assets.images.newsTeamKarriereImage1.image().image,
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
            const _SectionContent3(),
            const CustomFooter(),
          ],
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Offene Stellenangebote',
              style: context.mainStyle1,
              textAlign: context.mainPageTextAlign,
            ),
            Text(
              'Du hast Lust, Teil unseres Teams zu werden? Dann bewirb dich jetzt bei uns!',
              style: context.mainStyle2,
              textAlign: context.mainPageTextAlign,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionContent2 extends StatelessWidget {
  const _SectionContent2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style1 = TextStyle(
      fontSize: 20,
      fontWeight: R.fontWidths.bold,
      color: const Color(0xFF6996BA),
    );

    final style2 = TextStyle(
      fontSize: 20,
      fontWeight: R.fontWidths.semiBold,
      color: Colors.black,
    );

    final style3 = TextStyle(
      fontSize: 12,
      fontWeight: R.fontWidths.medium,
      color: Colors.black,
    );

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 47,
        bottom: 100,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 180),
            child: Text(
              'Jobs: 6 | Standorte: 2 | Kategorien: 1',
              style: R.styles.lSNormalStyle.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 43),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 205),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoundedHeader.search(
                    text: 'Stellen durchsuchen',
                    style: R.styles.lSNormalStyle.copyWith(
                      fontSize: 16,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bremen',
                          style: style1,
                        ),
                        const SizedBox(height: 40),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const ['Baubegleiter / Projektsupport FTTX (m/w/d)'],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                        ),
                        const SizedBox(height: 30),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const [
                            'Bauleiter (m/w/d) für die Bereiche Kabelanlagen, Rohrleitungsbau, ',
                            'Kommunikationsnetze und Hausanschlüsse',
                          ],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                        ),
                        const SizedBox(height: 30),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const ['Mitarbeiter (m/w/d) im Bereich Lager/Logistik'],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                        ),
                        const SizedBox(height: 30),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const [
                            'Personalreferent (m/w/d) in Teilzeit (20-30 Std./Woche)'
                          ],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                        ),
                        const SizedBox(height: 30),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const ['Schlosser / Schweißer (m/w/d) für unsere Werkstatt'],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                        ),
                        const SizedBox(height: 60),
                        Text(
                          'Hamburg',
                          style: style1,
                        ),
                        const SizedBox(height: 40),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const [
                            'Kfm. Angestellter Baubüro (m/w/d) in Voll- oder Teilzeit'
                          ],
                          subtitle: 'Festanstellung, Voll- oder Teilzeit  ·  Hamburg',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.style2,
    required this.style3,
    required this.titleList,
    required this.subtitle,
  });

  final TextStyle style2;
  final TextStyle style3;
  final List<String> titleList;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...titleList
                  .map(
                    (title) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: style2,
                        ),
                        const SizedBox(height: 7),
                      ],
                    ),
                  )
                  .toList(),
              Text(
                'Festanstellung, Vollzeit  ·  Bremen',
                style: style3,
              ),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios_outlined)
      ],
    );
  }
}

class _SectionContent3 extends StatelessWidget {
  const _SectionContent3({Key? key}) : super(key: key);

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
